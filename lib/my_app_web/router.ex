defmodule MyAppWeb.Router do
  use MyAppWeb, :router
   import MyAppWeb.Profile

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {MyAppWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :fetch_current_user
  end
  pipeline :api do
    plug :accepts, ["json"]
  end
  scope "/api", MyAppWeb do
    pipe_through :api
    get "/hello", ApiController, :index
    get "/feedbacks", ApiController, :get_feedbacks
    post "/add_feedbacks", ApiController, :add_feedback
    put "/update_feedbacks/:id", ApiController, :update_feedback
    delete "/delete_feedbacks/:id" , ApiController , :delete_feedback



  end
  # Swagger UI serve karne ka route
  scope "/" do
    forward "/swagger", PhoenixSwagger.Plug.SwaggerUI,
      otp_app: :my_app,
      swagger_file: "swagger.json"
  end
  scope "/", MyAppWeb do
 pipe_through :browser
 get "/", PageController, :home
  # get form of creation of feedback
 get "/feedback/create", FeedbackController, :new
# Show greetings page after submission
 get "/feedback/greetings", FeedbackController, :greetings
# View all feedback entries with search
 get "/feedbacks", FeedbackController, :get_feedback
# route to add database enteries in db
 post "/feedbacks" , FeedbackController , :create
 # update
 get "/feedback/edit/:id", FeedbackController, :edit
 # update into database
 put "/feedback/update/:id", FeedbackController, :update
  # delete from page as well ad database
 delete "/feedback/delete/:id", FeedbackController, :delete
   get "/user/login", UserController , :login_new
   post "/user/login", UserController , :login_create
   get "/user/signup" , UserController ,:signup_new
   post "/user/signup", UserController , :signup_create
   get "/about" , PageController ,:about
   get "/contact"  , PageController ,:contact
   get "/dashboard" ,PageController , :dashboard
   live "/products-live" ,ProductLive.Index
  live "/dashboard123", DashBoard.Index
   get "/register/user" , RegisterController , :register
   post "/register/user" , RegisterController , :register_user
   get "/users/:user_id/feedback", UserController, :get_userfeedbacks
   get "/users" , UserController , :get_users
   get "/feedbacks/user", FeedbackController, :get_feedback_by_user_id
   get "/logout", UserController, :logout
   get "/profile" , ProfileController , :profile
  end


  # Other scopes may use custom stacks.
  # scope "/api", MyAppWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:my_app, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: MyAppWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end

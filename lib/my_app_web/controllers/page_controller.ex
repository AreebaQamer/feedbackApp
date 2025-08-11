defmodule MyAppWeb.PageController do
  use MyAppWeb, :controller
  alias MyApp.Feedbacks
      def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
  end
   def about(conn , _params) do
    render(conn, :about)
   end
    def contact(conn, _params) do
      render(conn, :contact)
    end
  def dashboard(conn, _params) do
    feedback = Feedbacks.get_latest_feedback()
    render(conn, :dashboard , feedback: feedback)
  end
end

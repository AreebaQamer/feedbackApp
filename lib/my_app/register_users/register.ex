defmodule MyApp.RegisterUsers.Register do
  use Ecto.Schema
  import Ecto.Changeset
  schema "register_users" do
    field :name, :string
    field :status, :string
    field :password, :string
    field :age, :integer
    field :email, :string

    timestamps(type: :utc_datetime)
  end
  def changeset(register, attrs) do
    register
    |> cast(attrs, [:name, :age, :email, :password, :status])
    |> validate_required([:name] , message: "Name is required")
    |> validate_format(:email , ~r/@gmail\.com/)
    |> validate_number(:age ,  greater_than_or_equal_to: 18 )
    |> validate_length(:name, max: 20)
    |> validate_inclusion(:status ,["active" , "inactive"])
    |> unique_constraint(:email)
    |> validate_password()
  end
 defp validate_password(changeset) do
  validate_change(changeset, :password, fn :password, password ->
    errors = []

    errors =
      if String.length(password) < 8 do
        [{"Password must be at least 8 characters long"} | errors]
      else
        errors
      end

    errors =
      if !Regex.match?(~r/(?=.*[A-Z])/, password) do
        [{"Password must contain at least one uppercase letter"} | errors]
      else
        errors
      end

    errors =
      if !Regex.match?(~r/(?=.*[a-z])/, password) do
        [{"Password must contain at least one lowercase letter"} | errors]
      else
        errors
      end
    errors =
      if !Regex.match?(~r/(?=.*\d)/, password) do
        [{"Password must contain at least one digit"} | errors]
      else
        errors
      end
    errors =
      if !Regex.match?(~r/(?=.*[@!#^&*%()`<>])/, password) do
        [{"Password must contain at least one special character"} | errors]
      else
        errors
      end

    Enum.map(errors, fn {msg} -> {:password, msg} end)
  end)
end

  end

defmodule MyAppWeb.ErrorHelpers do
use Phoenix.HTML
 def error_tag(form, field) do
  Enum.map(Keyword.get_values(form.errors, field), fn error ->
    content_tag(:span, translate_error(error), class: "help-block")
  end)
end
  def translate_error({msg, opts}) do
    # Default translation function
    Enum.reduce(opts, msg, fn {key, value}, acc ->
      String.replace(acc, "%{#{key}}", to_string(value))
    end)
  end
end

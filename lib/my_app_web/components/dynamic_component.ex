# defmodule MyAppWeb.DynamicComponent do
#   use Phoenix.Component

#   attr :module, :atom, required: true
#   attr :function, :atom, required: true
#   attr :shared, :string, required: true

#   slot :named_slot, required: true
#   slot :inner_block, required: true

#   def dynamic_component(assigns) do
#     {mod, assigns} = Map.pop(assigns, :module)
#     {func, assigns} = Map.pop(assigns, :function)

#     apply(mod, func, [assigns])
#   end
# end

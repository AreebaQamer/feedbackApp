# defmodule MyAppWeb.Card do
#   use Phoenix.Component

#   attr :shared, :string, required: true
#   slot :inner_block, required: false
#   slot :named_slot, required: false

#   def show(assigns) do
#     ~H"""
#     <div class="p-4 border rounded bg-gray-50">
#       <h2 class="font-bold text-blue-600">Shared Prop: <%= @shared %></h2>
#       <div class="mt-2 text-gray-700">
#         <%= render_slot(@inner_block) %>
#         <%= render_slot(@named_slot) %>
#       </div>
#     </div>
#     """
#   end
# end

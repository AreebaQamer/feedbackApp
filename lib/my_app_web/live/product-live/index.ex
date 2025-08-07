# defmodule MyAppWeb.ProductLive.Index do
#   use MyAppWeb, :live_view
#   import Phoenix.Component

#   # Component attributes and slots
#   attr :name, :string, default: "Bob"
#   attr :message, :string, required: true
#   attr :age, :integer, required: true
#   attr :rest_data, :global
#   slot :inner_block, required: true
#   attr :entries, :list, default: []
#   slot :column, doc: "Columns with column labels" do
#     attr :label, :string, required: true
#   end
#   attr :rows, :list, default: []

#   # Greet Component
#   def greet(assigns) do
#     ~H"""
#     <p class="text-lg font-semibold text-gray-800">Hello, {@name}, You are {@age} years old</p>
#     """
#   end

#   # Custom Header Component
#   def custom_header(assigns) do
#     ~H"""
#     <nav class="bg-white shadow-md sticky top-0 z-50">
#       <div class="max-w-7xl mx-auto px-6 py-4 flex justify-between items-center">
#         <div class="flex items-center space-x-3">
#           <svg class="h-8 w-8 text-blue-600" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
#             <path stroke-linecap="round" stroke-linejoin="round" d="M3 12l2-2m0 0l7-7 7 7m-9 12V9m-4 4h16" />
#           </svg>
#           <a href="#" class="text-2xl font-bold text-gray-800">MyApp</a>
#         </div>
#         <ul class="flex space-x-8 text-gray-700 font-medium text-lg">
#           <li><a href="/" class="hover:text-blue-600 transition">Home</a></li>
#           <li><a href="/about" class="hover:text-blue-600 transition">About</a></li>
#           <li><a href="#" class="hover:text-blue-600 transition">Services</a></li>
#           <li><a href="/contact" class="hover:text-blue-600 transition">Contact</a></li>
#         </ul>
#       </div>
#     </nav>
#     """
#   end

#   # Form Component
#   def custom_form(assigns) do
#     ~H"""
#     <div class="max-w-xl mx-auto mt-10 bg-white p-8 rounded-xl shadow-lg">
#       <%= render_slot(@inner_block) %>
#     </div>
#     """
#   end

#   # Notification Component
#   def notifications(assigns) do
#     ~H"""
#     <span {@rest_data} class="text-sm text-red-600"> {@message} </span>
#     """
#   end

#   # Button with slot
#   def custom_button(assigns) do
#     ~H"""
#     <button class="bg-blue-500 hover:bg-blue-600 text-white font-medium px-5 py-2 rounded shadow">
#       <%= render_slot(@inner_block) %>
#     </button>
#     """
#   end

#   # Unordered List
#   def unordered_list(assigns) do
#     ~H"""
#     <ul class="list-disc list-inside space-y-1 text-gray-700 mt-6">
#       <li :for={entry <- @entries}>
#         <%= render_slot(@inner_block, entry) %>
#       </li>
#     </ul>
#     """
#   end

#   # Table Component
#   def custom_table(assigns) do
#     ~H"""
#     <div class="overflow-x-auto mt-10">
#       <table class="min-w-full bg-white shadow rounded-lg">
#         <thead class="bg-gray-100 text-left text-gray-600 uppercase text-sm font-bold">
#           <tr>
#             <th :for={col <- @column} class="px-6 py-4 border-b">{col.label}</th>
#           </tr>
#         </thead>
#         <tbody>
#           <tr :for={row <- @rows} class="hover:bg-gray-50 transition">
#             <td :for={col <- @column} class="px-6 py-4 border-b text-gray-800">
#               <%= render_slot(col, row) %>
#             </td>
#           </tr>
#         </tbody>
#       </table>
#     </div>
#     """
#   end

#   # Render function
#   def render(assigns) do
#     ~H"""
#     <.custom_header />

#     <.custom_form>
#       <form class="space-y-6">
#         <div>
#           <label for="name" class="block text-gray-700 font-semibold">Name</label>
#           <input type="text" id="name" name="name" class="w-full mt-1 p-2 border border-gray-300 rounded focus:ring-blue-500 focus:border-blue-500" placeholder="Enter your name" />
#         </div>

#         <div>
#           <label for="email" class="block text-gray-700 font-semibold">Email</label>
#           <input type="email" id="email" name="email" class="w-full mt-1 p-2 border border-gray-300 rounded focus:ring-blue-500 focus:border-blue-500" placeholder="Enter your email" />
#         </div>

#         <div class="text-right">
#           <button type="submit" class="bg-blue-600 hover:bg-blue-700 text-white font-bold py-2 px-6 rounded transition">
#             Submit
#           </button>
#         </div>
#       </form>
#     </.custom_form>

#     <div class="max-w-xl mx-auto mt-10">
#       <.unordered_list :let={fruit} entries={~w(apples bananas cherries)}>
#         I like <b class="text-blue-600">{fruit}</b>!
#       </.unordered_list>
#     </div>

#     <.custom_table rows={[%{name: "areeba", age: 24}, %{name: "alishba", age: 34}]} column={[
#       %{label: "Name", slot: :name},
#       %{label: "Age", slot: :age}
#     ]}>
#       <:column :let={user} label="Name">
#         <%= user.name %>
#       </:column>
#       <:column :let={user} label="Age">
#         <%= user.age %>
#       </:column>
#     </.custom_table>
#     """
#   end
# end

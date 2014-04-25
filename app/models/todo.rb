=begin	
		todos.rb
		Authors: Dominic Furano and Michael Smith
		Date: 4/25/14
		Description: describes a todo item.
=end

class Todo < ActiveRecord::Base

  # A Todo has a single field: todo_item.
  validates :todo_item, presence: true
end

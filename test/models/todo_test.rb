=begin	
		todos_test.rb
		Authors: Michael Smith
		Date: 4/25/14
		Description: contains three basic tests.
=end

require 'test_helper'

class TodoTest < ActiveSupport::TestCase
	# A user shouldn't be able to enter a blank todo.
	test "can't save a blank todo" do
	t = Todo.new
	assert_not t.save, "Created a blank todo"
	end
	
	# Nonblank todos, however, are fine.
	test "can save a nonblank todo" do
	t = Todo.new
	t.todo_item = "nonblack todo"
	assert t.save, "Failed to created a nonblank todo"
	end
	
	# Make sure the todo's text matches what the user actually entered.
	test "todo text retrieved" do
	t = Todo.new
	testing_text = "my todo text"
	t.todo_item = testing_text
	assert_equal t.todo_item, testing_text, "Testing text doesn't match"
	end
end

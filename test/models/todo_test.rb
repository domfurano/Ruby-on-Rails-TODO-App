require 'test_helper'

class TodoTest < ActiveSupport::TestCase
	test "the truth" do
		assert true
	end
	
	test "can't save a blank todo" do
	t = Todo.new
	assert_not t.save, "Created a blank todo"
	end
end

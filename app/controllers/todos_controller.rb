class TodosController < ApplicationController
	def index
		@todo_items = Todo.all
	end
	
	def delete
		#put delete logic here
		t = Todo.last
		t.delete
		t.save
	end
end
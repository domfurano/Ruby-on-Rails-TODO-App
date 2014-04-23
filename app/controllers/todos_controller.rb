class TodosController < ApplicationController
	def index
		@todo_items = Todo.all
		render :index
	end

	def delete
		#put delete logic here
		t = Todo.last
		t.delete
		t.save
	end

	def add
		todo = Todo.create(:todo_item => params[:todo_text])
		if !todo.valid?
			flash[:error] = todo.errors.full_messages.join("<br\>").html_safe
		end
		redirect_to :action => 'index'
	end
end

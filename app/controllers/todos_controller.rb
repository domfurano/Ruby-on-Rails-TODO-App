=begin	
		todos_controller.rb
		Authors: Dominic Furano and Michael Smith
		Date: 4/25/14
		Description: describes what to do when navbar buttons are clicked.
=end

class TodosController < ApplicationController

	# Method for the index page.
	def index
		@new_todo = Todo.new
		render :index
	end

	# Method for the "completed" page.
	def completed
		@todo_items = Todo.all
		if !params[:todos_checkbox].nil?
			params[:todos_checkbox].each do |check|
				todo_id = check
				t = Todo.find_by_id(todo_id)
				# Had to combine delete button action here.
				if params[:delete_button]
					t.delete
					t.save
				# Else the complete button was selected.
				else
					if t.read_attribute(:completed) == false
						t.update_attribute(:completed, true)
					else
						t.update_attribute(:completed, false)
					end
				end
			end
		end
	end

	# Method for the "incomplete" page.
	def incomplete
		@todo_items = Todo.all
		if !params[:todos_checkbox].nil?
			params[:todos_checkbox].each do |check|
				todo_id = check
				t = Todo.find_by_id(todo_id)
				# Had to combine delete button action here.
				if params[:delete_button]
					t.delete
					t.save
				# Else the complete button was selected.
				else
					if t.read_attribute(:completed) == false
						t.update_attribute(:completed, true)
					else
						t.update_attribute(:completed, false)
					end
				end
			end
		end
	end

	# Method for the Add todo form.
	def add
		todo = Todo.create(:todo_item => params[:todo][:todo_item])
		if !todo.valid?
			flash[:error] = todo.errors.full_messages.join("<br\>").html_safe
		else
			todo.update_attribute(:completed, false)
			flash[:success] = "todo added"
		end
		redirect_to :action => 'index'
	end
end

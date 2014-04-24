class TodosController < ApplicationController

	def index
		@todo_items = Todo.all
		@new_todo = Todo.new
		render :index
	end

	def new
	end

	def delete
		@todo = Todo.find(params[:id])
		@todo.delete
		redirect_to :action => "index"
	end

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

	def complete
		# Check to see if any boxes are checked.
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
	redirect_to :action => 'index'
	end

end

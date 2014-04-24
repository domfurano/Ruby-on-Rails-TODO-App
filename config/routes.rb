Rails.application.routes.draw do

  match "todos/index" => "todos#index", :as => :index, via: [:get, :post]

  match "todos/add" => "todos#add", :as => :add, via: [:get, :post]

  match "todos/delete" => "todos#delete", :as => :delete, via: [:get, :post]

  match "todos/complete" => "todos#complete", :as => :complete, via: [:get, :post]

  match "todos/completed" => "todos#completed", :as => :completed, via: [:get, :post]

  match "/todos/incomplete" => "todos#incomplete", :as => :incomplete, via: [:get, :post]

end

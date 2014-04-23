Rails.application.routes.draw do
  match "todos/index" => "todos#index", :as => :index, via: [:get, :post]

  match "todos/add" => "todos#add", :via => :post

  match "todos/delete" => "todos#delete", :as => :delete, via: [:get, :post]

end

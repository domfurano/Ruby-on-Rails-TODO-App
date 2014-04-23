Rails.application.routes.draw do
  get 'todos/index'

  match "todos/delete" => "todos#delete", :as => :delete, via: [:get, :post]

end

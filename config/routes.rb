Rails.application.routes.draw do
  root "home#index"
  resources :spots, only: [:index, :show]
  get "recommendations", to: "recommendations#index", as: :recommendations

  get "switch_locale/:locale", to: "application#switch_locale", as: :switch_locale

  get "admin/index", to: "admin#index", as: :admin_index
  get "admin/new", to: "admin#new", as: :admin_new
  post "admin/create", to: "admin#create", as: :admin_create

  get "admin/edit/:id", to: "admin#edit", as: :admin_edit
  patch "admin/update/:id", to: "admin#update", as: :admin_update

  get "admin/delete/:id", to: "admin#delete", as: :admin_delete
  delete "admin/destroy/:id", to: "admin#destroy", as: :admin_destroy

  get "up" => "rails/health#show", as: :rails_health_check
end

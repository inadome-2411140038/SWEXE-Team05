Rails.application.routes.draw do
  root "home#index"

  get "switch_locale/:locale", to: "application#switch_locale", as: :switch_locale

  get "admin/index"
  get "admin/new"
  get "admin/edit"
  get "admin/delete"

  get "up" => "rails/health#show", as: :rails_health_check
end
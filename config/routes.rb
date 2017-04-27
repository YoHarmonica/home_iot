Rails.application.routes.draw do
  get 'static_pages/home'

  get 'static_pages/help'

  root 'static_pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # API用
  namespace :api, {format: 'json'} do
    namespace :v1 do
      namespace :temperatures do
        get "/" , :action => "index"
      end
    end
  end
end

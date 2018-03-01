Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :cnaes, only:[:index]
      get 'cnaes/save', to: 'cnaes#save'
    end
  end

end

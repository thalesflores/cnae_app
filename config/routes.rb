Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'save', to: 'cnaes#save'
    end
  end

end

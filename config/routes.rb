Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
  resources :contacts, only: [:new, :create] do
    collection do
      get 'thanks', controller: 'contacts/thanks', action: 'index'
    end
  end
end

Adminsimple::Engine.routes.draw do

  # Dashboard route
  root to: 'adminsimple/dashboard#index'

  # Settings route
  get 'settings' => 'adminsimple/settings#index'

  # Styleguide route
  get 'styleguide(/:action)' => 'adminsimple/styleguide#show', as: :styleguide

  # Devise routing
  devise_for Adminsimple.configuration.devise_model.to_s.pluralize.to_sym,
    path: '',
    skip: [:registrations, :confirmations],
    skip_helpers: true,
    module: :devise,
    controllers: {
      sessions: 'adminsimple/devise/sessions',
      passwords: 'adminsimple/devise/passwords',
      omniauth_callbacks: 'adminsimple/devise/omniauth_callbacks'
    }
  devise_scope Adminsimple.configuration.devise_model do
    resource :registration,
      only: [:edit, :update],
      path: 'profile',
      controller: 'adminsimple/devise/registrations',
      as: :registration
  end

end

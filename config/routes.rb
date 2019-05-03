# frozen_string_literal: true

Rails.application.routes.draw do
  root 'static_pages#index'

  devise_for :admins, controllers: { sessions: 'admins/sessions',
                                     registrations: 'admins/registrations' }

  devise_for :professionals, controllers: { sessions: 'professionals/sessions',
                                            registrations: 'professionals/registrations' }

  devise_for :users, controllers: { sessions: 'users/sessions',
                                    registrations: 'users/registrations' }

  resources :tenants
  resources :proprietors
  resources :appointements

  resources :homes do
    resources :tenant_homes
    resources :tenants
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

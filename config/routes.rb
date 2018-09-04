# frozen_string_literal: true

Rails.application.routes.draw do
  resources :projects do
    resources :tasks do
      member do
        patch :complete
      end
    end
  end
  root 'projects#index'
end

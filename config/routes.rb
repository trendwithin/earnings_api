require 'api_version'

Rails.application.routes.draw do
  root 'earnings#index'
  resources :earnings, only: [:index] do
    collection do
      get 'retrieve'
    end
  end
  namespace :api, defaults: { format: :json }, constraints: { subdomain: 'api' },
  path: '/' do
    scope module: :v1, constraints: ApiVersion.new(version: 1, default: true) do
      resources :earnings, only: [:index]
    end
  end

end

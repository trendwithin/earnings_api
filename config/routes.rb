require 'api_version'

Rails.application.routes.draw do
  namespace :api, defaults: { format: :json }, constraints: { subdomain: 'api' },
  path: '/' do
    scope module: :v1, constraints: ApiVersion.new(version: 1, default: true) do
      # resources
    end
  end
end

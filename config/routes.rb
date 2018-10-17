Rails.application.routes.draw do
  get "/contacts" => "contact#index"
  get "/contacts/:id" => "contact#show"
  post "/contacts" => "contact#create"
  patch "/contacts/:id" => "contact#update"
  delete "/contacts/:id" => "contact#destroy"
end

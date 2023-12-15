Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
    resources :lists do
      resources :bookmarks, only: %i[new create] #me crea lasrutas nesteadas dentro de las listas
    end
  resources :bookmarks, only: :destroy # con esto puedo cr4ear un boton que sirva para borrar un bookmark en particular, a traves de un id. por eso no me sirve el id de list, no me sirve que este adentro.
  # Defines the root path route ("/")
  #root "posts#index"
  root to: "lists#index" # ESTO DEFINE QUE PAGINA QUERES QUE EST EN EL HOME (ROUTE)
end

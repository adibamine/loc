Rails.application.routes.draw do

	root 'pages#home'

	 devise_for :users, 
	  			:path => '', 
	  			:path_names => {:sign_in => 'login', :sign_out => 'logout', :edit => 'profile'},
	  			:controllers => {:omniauth_callbacks => 'omniauth_callbacks',
	  							 :registrations => 'registrations'
	  							}

	resources :users, only: [:show]
	resources :voitures
	resources :clients
	resources :photos
	resources :reservations
	resources :reviews
	resources :emails, only: [:create]
	resources :commandes, only: [:index, :create]

	resources :voitures do 
		resources :reservations, only: [:create]
	end

	  resources :users do
	  	resources :reviews, only: [:create, :destroy]
	  end

	get '/voitures/:id/reservate' => 'reservations#new', :as => :reservate_voiture
	get '/voitures/:id/disable', to: 'voitures#disable', :as => :disable_voiture
	get '/voitures/:id/enable', to: 'voitures#enable', :as => :enable_voiture
	get '/reservations/:id/disable', to: 'reservations#disable', :as => :disable_reservation
	get '/preload' => 'reservations#preload'
	get '/preview' => 'reservations#preview'
	post '/increment_num' => 'voitures#increment_num'
	post '/increment_num_user' => 'users#increment_num'

	get '/vos_locations' =>'reservations#vos_locations'
	get '/vos_reservations' =>'reservations#vos_reservations'
	get '/stats' => 'users#stats'
	get '/avis' => 'reviews#index'
	get '/search' => 'pages#search'
	get '/espace_clients' => 'pages#espace_clients', :as => :espace_clients
	get '/faq' => 'pages#faq', :as => :faq
	get '/contact' => 'pages#contact', :as => :contact

	get '/marmara' => 'users#show', id: 4
	get '/offres' => 'pages#offres'
	get '/pack_personnel' => 'pages#pack_personnel'

end

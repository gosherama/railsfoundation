Rails.application.routes.draw do
  #routing is case sensitive - URI resource /about != /About
  #https://railsfoundation-gosher.c9users.io/about
  get 'contact', to: 'pages#contact'
  get 'about', to: 'pages#about'
  get 'error', to: 'pages#error'
  
  #Redirect to external website
  get "blog", to: redirect('https://gosheramaprod.wordpress.com/')
  
  #Reserved keyword - Creates 7 CRUD routes
  resources :projects
  
  #Setting the home page
  root 'pages#home'
  
  #Define a 'catch all' redirect page - Always placed at the bottom of the routes file
  get '*path', to: redirect('/error')
end

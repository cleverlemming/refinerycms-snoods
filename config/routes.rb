Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :snoods do
    resources :snoods, :path => '', :only => [:new, :create] do
      member do
    #post "/snoods/:id" => "snoods#create"
    #get "new" => "snoods#new"
    get 'bravo' => "snoods#bravo"
  end
  end
match 'bravo' => 'snoods#bravo', :via => :get  

 

end

  # Admin routes
  namespace :snoods, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :snoods do
        #list all requesters
        #keep settings in ENV
        member do
      #post "/snoods/:id" => "snoods#create"
      #get "new" => "snoods#new"
      end
      end
    end
  end
end

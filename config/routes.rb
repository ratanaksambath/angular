Rails.application.routes.draw do

	devise_for :users
	
	resources :posts, only: [:create, :index, :show] do
		resources :comments, only: [:show, :create] do
			member do
				put '/upvote' => 'comments#upvote'
			end
		end

		member do
			put '/upvote' => 'posts#upvote'
		end
	end

	root to: 'application#angular'
end

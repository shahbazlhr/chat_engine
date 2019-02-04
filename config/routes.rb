Rails.application.routes.draw do
  devise_for :super_admins
  devise_for :users

devise_scope :super_admin do
    authenticated do
      root to: 'super_admin_dashboard#index', as: 'authenticated_super_admin_root'
  	end

  end
  devise_scope :user do
    authenticated do
      root to: 'user_dashboard#index', as: 'authenticated_user_root'
  	end
  end

  root to: 'user_dashboard#index'
  # super_admin_root to: 'super_admin_dashboard#index' 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

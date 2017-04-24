ShopifyApp::Engine.routes.draw do
  controller :sessions do
    get 'login' => :new, :as => :login
    post 'login' => :create, :as => :authenticate
    get 'auth/shopify/callback' => :callback
    get 'logout' => :destroy, :as => :logout
  end

  controller :user_sessions do
    get 'login' => :new, :as => :login_user
    post 'login' => :create, :as => :authenticate_user
    get 'auth/shopify_user/callback' => :callback_user
    get 'logout' => :destroy, :as => :logout_user
  end

  namespace :webhooks do
    post ':type' => :receive
  end
end

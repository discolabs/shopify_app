module ShopifyApp
  module UserSessionsConcern
  extend ActiveSupport::Concern

  included do
    include ShopifyApp::LoginProtection
    before_action :shopify_user
  end

  def new
  end

  def create
    authenticate
  end

  def callback
    if auth_hash
      login_user
      redirect_to return_address
    else
      redirect_to root_path
    end
  end

  def destroy
    session[:shopify_user] = nil
    redirect_to root_path
  end

  protected

    def associated_user(auth_hash)
      auth_hash['extra']['associated_user']
    end

    def authenticate
      if sanitized_shop_name.present?
        fullpage_redirect_to "#{main_app.root_path}auth/shopify_user?shop=#{@shop_session.domain}"
      else
        redirect_to return_address
      end
    end

    def login_user
      @user = ShopifyApp::User.create_from_auth(associated_user(auth_hash), @shop_session)
      session[:shopify_user] = @user.id
    end

    def return_address
      session.delete(:return_to) || main_app.root_url
    end

  private

    def shopify_user
      @user = ShopifyApp::User.find(session[:shopify_user])
    rescue ActiveRecord::RecordNotFound
      redirect_to shopify_app.new_user_session_path
    end

  end
end

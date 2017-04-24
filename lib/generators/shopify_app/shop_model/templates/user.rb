class User < ActiveRecord::Base
  include ShopifyApp::User
  include ShopifyApp::SessionStorage
end

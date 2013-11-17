module ControllerHelpers
  def create_user
    FactoryGirl.create(:trial_plan)

    @user = FactoryGirl.create(:admin_user)
    @user.update_auth_token = true
    @user.save    
  end
  
  def basic_auth(user)
    ActionController::HttpAuthentication::Basic.encode_credentials(user.email, user.password)
  end
end

RSpec.configure do |config|
  config.include ControllerHelpers, :type => :controller
end
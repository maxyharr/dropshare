OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  
  if Rails.env == "development" || Rails.env == "test"
    provider :facebook, "734159986623825", "fb44d7bca8dccb0403f01edc0044556d"
  else
    provider :facebook, "561983067232884", "9e4cbd261a276a7ae828433726ab402f"
  end
end
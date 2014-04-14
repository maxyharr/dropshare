class User < ActiveRecord::Base
  def self.from_omniauth(auth)
    # if auth == nil
#       user.provider = "facebook"
#       user.uid      = "12345"
#       user.name     = "Test User"
#     else
      where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.name = auth.info.name
        user.oauth_token = auth.credentials.token
        user.oauth_expires_at = Time.at(auth.credentials.expires_at)
        user.save!
      end
    # end
  end
end

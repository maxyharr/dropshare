module UsersHelper
  public
  def set_pubid(strattempt = nil)
    if strattempt == nil
      randstr = SecureRandom.urlsafe_base64(8)
    end
    User.all.each do |user|
      if user.pubid == randstr
        set_pubid()
        break
      end
    end
    return randstr
  end
end

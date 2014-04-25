module UsersHelper
  private
  def alphanum(size=8)

    s = ""
    size.times {s << (i = Kernel.rand(62); i += ((i < 10) ? 48 : ((i < 36) ? 55 : 61 ))).chr }
  end

  public
  def set_pubid(strattempt = nil)
    if strattempt == nil
      randstr = alphanum()
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

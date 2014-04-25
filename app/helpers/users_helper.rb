module UsersHelper
  def alphanum(size=8)

    s = ""
    size.times {s << (i = Kernel.rand(62); i += ((i < 10) ? 48 : ((i < 36) ? 55 : 61 ))).chr }
  end

  def userid(strattempt = nil)
    if strattempt == nil
      randstr = alphanum()
    end
    @users.each do |user|
      if user.pubid == randstr
        userid()
        break
      end
    end
    return randstr
  end
end

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def full_name
    if family_name?
      full_name = family_name + given_name
    else
      family_name = 'family_name'
      given_name = 'given_name'
      full_name = family_name + given_name
    end
    return full_name
  end

end

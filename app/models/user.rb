class User < ActiveRecord::Base
  has_many :appointments
  has_many :user_roles
  has_many :roles, through: :user_roles

  def self.from_omniauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.uid                = auth_info.uid
      new_user.username           = auth_info.info.email
    end
  end
end

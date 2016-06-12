class User < ActiveRecord::Base
  has_many :user_roles
  has_many :roles, through: :user_roles

  def self.from_omniauth(auth_info)
    if User.find_by(profile: auth_info["info"]["urls"]["Google"])
      where(uid: auth_info[:uid]).update_or_create(
        uid: auth_info.uid,
        username: auth_info.info.name
      )
      first
    end

  end

  def self.update_or_create(attributes = {})
    assign_or_new(attributes).save
  end

  def self.assign_or_new(attributes)
    obj = first || new
    obj.assign_attributes(attributes)
    obj
  end

end

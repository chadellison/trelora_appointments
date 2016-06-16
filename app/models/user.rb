class User < ActiveRecord::Base
  enum role: [ :default, :admin, :keith ]
end

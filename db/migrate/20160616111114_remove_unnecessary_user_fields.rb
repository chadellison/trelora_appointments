class RemoveUnnecessaryUserFields < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.remove :uid
      t.remove :oauth_token
      t.remove :profile
    end
  end
end

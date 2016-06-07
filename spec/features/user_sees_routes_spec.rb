require 'rails_helper'

RSpec.feature "User sees routes" do
  scenario "if they're logged in" do
    @users = create_users(3)
    @roles = create_roles
    create_user_role(@users.first.id,@roles.first.id)
    create_user_role(@users.second.id,@roles.second.id)
    create_user_role(@users.last.id,@roles.last.id)
    create_locations
    create_appointments
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@users.first)

    visit '/'

    # within()
      expect(page).to have_content(@users.second.username)
      expect(page).to have_content(@users.second.icon)
    # end

    # within()
      expect(page).to have_content(@users.third.username)
      expect(page).to have_content(@users.third.icon)
    # end

  end

end

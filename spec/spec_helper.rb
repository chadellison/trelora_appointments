require 'simplecov'
SimpleCov.start 'rails' do
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  def create_users(num)
    num.times do |i|
      User.create(username: "name#{i}")
    end
    @users = User.all
  end

  def create_roles
    Role.create(title: "admin")
    Role.create(title: "appraiser")
    Role.create(title: "photographer")
    Role.all
  end

  def create_user_role(user_id,role_id)
    UserRole.create(user_id: user_id, role_id: role_id)
  end

  def create_locations
    Location.create(address: "1510 blake st., Denver, CO")
    Location.create(address: "Fort Collins, CO")
    Location.create(address: "2260 Coronado pkwy n, Denver, CO")
    Location.create(address: "Aurora, CO")
    Location.create(address: "Boulder, CO")
    Location.create(address: "Thornton, CO")
    Location.create(address: "181 west mineral ave., Littleton, CO 80120")
    Location.create(address: "Northglenn, CO")
    @locations = Location.all
  end

  def create_appointments
    3.times do |i|
      Appointment.create(location_id: @locations.all[i].id, start_time: Date.current)
    end

    5.times do |i|
      Appointment.create(location_id: Location.all[i + 3].id, start_time: Date.current)
    end
    Appointment.all
  end

end

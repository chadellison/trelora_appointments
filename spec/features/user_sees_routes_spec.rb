require 'rails_helper'
#
RSpec.feature "User sees routes" do
  scenario "if they're logged in" do
    user = User.create(username: "jones", password: "123")
    field_worker1 = FieldWorker.create(username: "antonio@trelora.com")
    field_worker2 = FieldWorker.create(username: "karen@trelora.com")
    GoogleCalendarService.new.store_events

    basic_auth!

    visit root_path
    expect(page).to have_content("antonio@trelora.com")
    expect(page).to have_content("karen@trelora.com")
  end
end

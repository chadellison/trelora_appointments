require "rails_helper"

RSpec.feature "Admin can remove trelorians" do

  VCR.use_cassette("admin can remove trelorians") do
    scenario "Admin no longer sees removed trelorians" do
      user = User.create(username: "jones", password: "123")

      basic_auth!

      visit root_path
      click_on "Remove User"

      expect(current_path).to eq root_path

      expect(page).to have_content "Users"

      expect(page).to have_content "jones"

      expect(User.count).to eq 1

      within ".user" do
        click_on "Remove"
      end

      expect(User.count).to eq 0
    end

    scenario "Admin removes field_worker" do
      user = User.create(username: "jones", password: "123")

      basic_auth!

      field_worker = FieldWorker.create(username: "Frank")

      visit root_path
      click_on "Remove User"
      expect(current_path).to eq root_path
      expect(page).to have_content "Field Workers"
      expect(page).to have_content "Frank"
      expect(FieldWorker.last.status).to eq "active"

      within ".field-worker" do
        click_on "Remove"
      end

      expect(FieldWorker.last.status).to eq "inactive"
    end
  end
end

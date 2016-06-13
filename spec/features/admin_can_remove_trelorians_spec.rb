require "rails_helper"

RSpec.feature "Admin can remove trelorians" do
  scenario "Admin no longer sees removed trelorians" do
    user = User.create(username: "Jones", profile: "https://plus.google.com/115492633106293884993")

    visit root_path

    click_on "Remove User"

    expect(current_path).to eq root_path

    expect(page).to have_content "Users"

    expect(page).to have_content "Jones"

    expect(User.count).to eq 1

    within ".user" do
      click_on "Remove"
    end

    expect(User.count).to eq 0
  end

  xscenario "Admin removes field_worker" do
    field_worker = FieldWorker.create(username: "Frank")

    visit root_path
    click_on "Remove User"
    expect(current_path).to eq root_path
    expect(page).to have_content "Field Workers"
    expect(page).to have_content "Frank"
    expect(FieldWorker.count).to eq 5

    within "li:nth-child(4)" do
      click_on "Remove"
    end

    expect(FieldWorker.count).to eq 5
  end

  scenario "Admin removes field_worker who has a route" do
    visit root_path
    click_on "Remove User"
    expect(current_path).to eq root_path
    expect(page).to have_content "Field Workers"
    expect(FieldWorker.count).to eq 5

    within "li:nth-child(4)" do
      click_on "Remove"
    end

    expect(FieldWorker.count).to eq 5
  end
end

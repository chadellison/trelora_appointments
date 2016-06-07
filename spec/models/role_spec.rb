require 'rails_helper'

RSpec.describe Role, type: :model do
  context "has_many" do
    it { is_expected.to have_many(:user_roles)}
    it { is_expected.to have_many(:users)}
  end
end

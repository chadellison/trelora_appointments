require 'rails_helper'

RSpec.describe User, type: :model do
  context "has_many" do
    it { is_expected.to have_many(:user_roles)}
    it { is_expected.to have_many(:roles)}
  end
end

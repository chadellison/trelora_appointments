require 'rails_helper'

RSpec.describe UserRole, type: :model do
  context "belong to" do
    it { is_expected.to belong_to(:role)}
    it { is_expected.to belong_to(:user)}
  end
end

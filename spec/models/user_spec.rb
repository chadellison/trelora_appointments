require 'rails_helper'

RSpec.describe User, type: :model do
  context "roles" do
    it { is_expected.to define_enum_for(:role) }
  end
end

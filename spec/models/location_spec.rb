require 'rails_helper'

RSpec.describe Location, type: :model do
  context "has many" do
    it { is_expected.to have_many(:appointments)}
  end
end

require 'rails_helper'

RSpec.describe FieldWorker, type: :model do
  context "has many" do
    it { is_expected.to have_many(:appointments)}
    it { is_expected.to have_many(:locations)}
  end
end

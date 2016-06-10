require 'rails_helper'

RSpec.describe Appointment, type: :model do
  context "belong to" do
    it { is_expected.to belong_to(:location)}
    it { is_expected.to belong_to(:field_worker)}
  end
end

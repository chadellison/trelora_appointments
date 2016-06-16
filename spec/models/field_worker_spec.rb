require 'rails_helper'

RSpec.describe FieldWorker, type: :model do
  context "has many" do
    it { is_expected.to have_many(:appointments)}
    it { is_expected.to have_many(:locations)}
  end

  it "can create field_workers" do
    expect(FieldWorker.count).to eq 0

    field_worker_data = {
      status: "active",
      username: "jones",
      role: 1
    }
    FieldWorker.create(field_worker_data)
    expect(FieldWorker.count).to eq 1
  end
end

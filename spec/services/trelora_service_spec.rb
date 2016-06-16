require "rails_helper"

RSpec.describe TreloraService do
  VCR.use_cassette("trelorian_small_img_url#trelora_service") do
    it "returns the icon of the field worker through the trelora id" do
      antonio = FieldWorker.create(username: "antonio@trelora.com")
      service = TreloraService.new
      expect(service.trelorian_small_img_url(8)).to eq "https://mytrelora-production.s3.amazonaws.com/members/avatar/8/small_Anton_20_2_.png"
    end
  end
end

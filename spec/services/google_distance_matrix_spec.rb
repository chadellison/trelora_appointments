require "rails_helper"

RSpec.describe GoogleDistanceMatrix do
  VCR.use_cassette("time#Google_distance_matrix") do
    it "returns the drive time in seconds between two locations" do
      location = "800 Howard St., San Francisco, CA 94103"
      location2 = "2260 Corondao Pkwy N Denver CO 80229"
      service = GoogleDistanceMatrix.new
      expect(service.time(location, location2)).to eq 65242
    end
  end
end

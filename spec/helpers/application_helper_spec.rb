require 'rails_helper'

describe ApplicationHelper do
  describe "#seconds_to_hms" do
    it "returns humanized time strings" do
      expect(seconds_to_hms(1)).to eq "0:00:01"
      expect(seconds_to_hms(1_000)).to eq "0:16:40"
      expect(seconds_to_hms(10_000)).to eq "2:46:40"
    end
  end
end

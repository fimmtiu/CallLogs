require 'rails_helper'

describe Log do
  let(:log) { create(:log) }

  describe "#hms_duration" do
    it "returns humanized time strings" do
      log.duration = 1
      expect(log.hms_duration).to eq "0:00:01"
      log.duration = 1000
      expect(log.hms_duration).to eq "0:16:40"
      log.duration = 10000
      expect(log.hms_duration).to eq "2:46:40"
    end
  end
end

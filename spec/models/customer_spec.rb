require 'rails_helper'

describe Customer do
  let(:customer) { create(:customer) }

  describe "#average_call_length" do
    let!(:logs) do
      [create(:log, customer: customer, duration: 100),
       create(:log, customer: customer, duration: 120)]
    end

    it "returns the average call length" do
      expect(customer.average_call_length).to eq 110
    end
  end
end

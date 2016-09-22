require 'rails_helper'

describe LogsController do
  let(:user) { create(:user) }
  let(:customer) { create(:customer) }
  before { sign_in user }

  let(:params) do
    {log: {
      user_id: user.id,
      customer_id: customer.id,
      notes: "Argle bargle blorf wugga wugga zot.",
      duration: 165}
    }
  end

  describe "index" do
    let!(:second_log) { create(:log, user: user, customer: customer, created_at: 2.hours.ago) }
    let!(:third_log)  { create(:log, user: user, customer: customer, created_at: 3.hours.ago) }
    let!(:first_log)  { create(:log, user: user, customer: customer, created_at: 1.hours.ago) }

    it "returns all logs ordered by created_at" do
      get :index
      expect(assigns(:logs)).to eq [first_log, second_log, third_log]
      expect(response).to render_template :index
    end
  end

  describe "new" do
    it "returns a new, unsaved Log model" do
      get :new
      expect(assigns(:log)).to be_a Log
      expect(assigns(:log)).to be_new_record
      expect(response).to render_template :new
    end
  end

  describe "create" do
    it "creates a log" do
      post :create, params
      expect(assigns(:log)).to be_a Log
      expect(assigns(:log)).to be_persisted
      expect(response).to redirect_to logs_path
    end

    context "when the input is bogus" do
      before { params[:log][:duration] = "-100" }

      it "shows an error" do
        post :create, params
        expect(assigns(:log)).to_not be_persisted
        expect(flash[:alert]).to match /^Failed to log/
        expect(response).to render_template :new
      end
    end
  end
end

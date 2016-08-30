require 'rails_helper'

describe CustomersController do
  let(:user) { create(:user) }
  before { sign_in user }

  let(:params) do
    {customer: {
      name: "Wurb Flathead",
      email: "wurb@frobozz.com",
      account_type: Customer::ACCOUNT_TYPES.last}
    }
  end

  describe "index" do
    let!(:bob)     { create(:customer, name: "Bob") }
    let!(:charlie) { create(:customer, name: "Charlie") }
    let!(:alice)   { create(:customer, name: "Alice") }

    it "returns all customers ordered by name" do
      get :index
      expect(assigns(:customers)).to eq [alice, bob, charlie]
      expect(response).to render_template :index
    end
  end

  describe "new" do
    it "returns a new, unsaved Customer model" do
      get :new
      expect(assigns(:customer)).to be_a Customer
      expect(assigns(:customer)).to be_new_record
      expect(response).to render_template :new
    end
  end

  describe "show" do
    let(:customer) { create(:customer) }

    it "loads the given Customer" do
      get :show, id: customer.id
      expect(assigns(:customer)).to eq customer
      expect(response).to render_template :show
    end
  end

  describe "edit" do
    let(:customer) { create(:customer) }

    it "loads the given Customer" do
      get :edit, id: customer.id
      expect(assigns(:customer)).to eq customer
      expect(response).to render_template :edit
    end
  end

  describe "create" do
    it "creates a customer" do
      post :create, params
      expect(assigns(:customer)).to be_a Customer
      expect(assigns(:customer)).to be_persisted
    end

    context "when the input is bogus" do
      before { params[:customer][:name] = "" }

      it "shows an error" do
        post :create, params
        expect(assigns(:customer)).to_not be_persisted
        expect(flash[:alert]).to match /^Failed to create/
        expect(response).to render_template :new
      end
    end
  end

  describe "update" do
    let(:customer) { create(:customer) }

    it "updates a customer" do
      patch :update, params.merge(id: customer.id)
      expect(assigns(:customer)).to be_a Customer
      expect(assigns(:customer)).to be_persisted
      expect(response).to redirect_to customer_path(customer)
    end

    context "when the input is bogus" do
      before { params[:customer][:name] = "" }

      it "shows an error" do
        patch :update, params.merge(id: customer.id)
        expect(assigns(:customer)).to be_changed
        expect(flash[:alert]).to match /^Failed to update/
        expect(response).to render_template :edit
      end
    end
  end

  describe "destroy" do
    let(:customer) { create(:customer) }

    it "destroys the customer" do
      delete :destroy, id: customer.id
      expect(assigns(:customer)).to eq customer
      expect(assigns(:customer)).to be_destroyed
      expect(response).to redirect_to customers_path
    end
  end
end

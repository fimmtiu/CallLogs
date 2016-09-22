class CustomersController < ApplicationController

  # A table which shows all customers in the system.
  def index
    @customers = Customer.all.order(:name)
    # SQL: SELECT * FROM customers ORDER BY customers.name ASC
  end

  # The "add a new customer" form.
  def new
    @customer = Customer.new
  end

  # A page of detailed information about a specific customer.
  def show
    @customer = Customer.find(params[:id])
    # SQL: SELECT * FROM customers WHERE customers.id = ? LIMIT 1
  end

  # The "edit an existing customer" form.
  def edit
    @customer = Customer.find(params[:id])
    # SQL: SELECT * FROM customers WHERE customers.id = ? LIMIT 1
  end

  # The back end for the "add a new customer" form.
  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      # SQL: INSERT INTO customers (name, email, account_type, created_at, updated_at) VALUES (?, ?, ?, ?, ?)
      flash[:notice] = "Created #{@customer.name}"
      redirect_to customer_path(@customer), id: @customer.id
    else
      flash[:alert] = "Failed to create customer: #{@customer.errors.full_messages.to_sentence}"
      render :new
    end
  end

  # The back end for the "edit an existing customer" form.
  def update
    @customer = Customer.find(params[:id])
    # SQL: SELECT * FROM customers WHERE customers.id = ? LIMIT 1
    if @customer.update_attributes(customer_params)
      # SQL: UPDATE customers SET name = ?, email = ?, account_type = ?, updated_at = ? WHERE customers.id = ?
      flash[:notice] = "Updated #{@customer.name}"
      redirect_to customer_path(@customer), id: @customer.id
    else
      flash[:alert] = "Failed to update #{@customer.name}: #{@customer.errors.full_messages.to_sentence}"
      render :edit
    end
  end

  # Deletes customers and their associated data.
  def destroy
    @customer = Customer.find(params[:id])
    # SQL: SELECT * FROM customers WHERE customers.id = ? LIMIT 1
    if @customer.destroy
      # SQL: DELETE FROM customers WHERE customers.id = ?
      flash[:notice] = "Deleted #{@customer.name}"
      redirect_to customers_path
    else
      flash[:alert] = "Failed to delete #{@customer.name}: #{@customer.errors.full_messages.to_sentence}"
      redirect_to :show
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :email, :account_type)
  end
end

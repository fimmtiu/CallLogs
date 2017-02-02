class LogsController < ApplicationController

  # A table of all the call logs in the system.
  def index
    @logs = Log.all.order("created_at DESC")
    # SQL: SELECT * FROM logs ORDER BY created_at DESC
  end

  # The "add a new call log" form.
  def new
    @log = Log.new
  end

  # The back end for the "add a new call log" form.
  def create
    @log = Log.new(log_params)
    if @log.save
      # SQL: INSERT INTO logs (user_id, customer_id, notes, duration, created_at, updated_at) VALUES (?, ?, ?, ?, ?, ?)
      flash[:notice] = "Logged call for #{@log.customer.name}"
      # SQL: SELECT * FROM customers WHERE customers.id = ? LIMIT 1
      redirect_to logs_path, id: @log.id
    else
      errors = @log.errors.full_messages.to_sentence
      flash[:alert] = "Failed to log call for #{@log.customer.name}: #{errors}"
      # SQL: SELECT * FROM customers WHERE customers.id = ? LIMIT 1
      render :new
    end
  end

  # We didn't bother adding the edit & delete functionality for the logs.

  private

  def log_params
    params.require(:log).permit(:user_id, :customer_id, :notes, :duration)
  end
end

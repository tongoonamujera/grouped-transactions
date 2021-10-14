class UserTransactionsController < ApplicationController
  before_action :set_user_transaction, only: %i[show edit update destroy]

  # GET /user_transactions or /user_transactions.json
  def index
    @user_transactions = current_user.user_transactions.archieved.order(created_at: :desc)
  end

  def archieved_transactions
    @user_transactions = current_user.user_transactions.not_archieved.order(created_at: :desc)
  end

  # GET /user_transactions/1 or /user_transactions/1.json
  def show
    @group_transactions = Group.all
    @group_transaction = GroupTransaction.new
  end

  # GET /user_transactions/new
  def new
    @user_transaction = UserTransaction.new
  end

  # GET /user_transactions/1/edit
  def edit
    # edit
  end

  # POST /user_transactions or /user_transactions.json
  def create
    @user_transaction = UserTransaction.new(user_transaction_params)

    respond_to do |format|
      if @user_transaction.save
        format.html { redirect_to @user_transaction, notice: 'User transaction was successfully created.' }
        format.json { render :show, status: :created, location: @user_transaction }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_transactions/1 or /user_transactions/1.json
  def update
    respond_to do |format|
      if @user_transaction.update(user_transaction_params)
        format.html { redirect_to @user_transaction, notice: 'User transaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_transaction }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_transactions/1 or /user_transactions/1.json
  def destroy
    @user_transaction.destroy
    respond_to do |format|
      format.html { redirect_to user_transactions_url, notice: 'User transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def update_payments
    @updated_payment = UserTransaction.find(params[:id])
    @updated_payment.update_payment

    redirect_to user_transactions_url
  end

  def archieve_payments
    @updated_payment = UserTransaction.find(params[:id])
    @updated_payment.archieve_payments

    redirect_to user_transactions_url
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user_transaction
    @user_transaction = UserTransaction.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_transaction_params
    params.require(:user_transaction).permit(:name, :amount, :user_id, :is_paid)
  end
end

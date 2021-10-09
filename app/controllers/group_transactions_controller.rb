class GroupTransactionsController < ApplicationController
  before_action :set_group_transaction, only: %i[show edit update destroy]

  # GET /group_transactions or /group_transactions.json
  def index
    @group_transactions = GroupTransaction.all
  end

  # GET /group_transactions/1 or /group_transactions/1.json
  def show
    #show
  end

  # GET /group_transactions/new
  def new
    @group_transaction = GroupTransaction.new
  end

  # GET /group_transactions/1/edit
  def edit
    # edit
  end

  # POST /group_transactions or /group_transactions.json
  def create
    @group_transaction = GroupTransaction.new(group_transaction_params)

    respond_to do |format|
      if @group_transaction.save
        format.html { redirect_to user_transactions_path, notice: 'Group transaction was successfully created.' }
        format.json { render :show, status: :created, location: @group_transaction }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @group_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /group_transactions/1 or /group_transactions/1.json
  def update
    respond_to do |format|
      if @group_transaction.update(group_transaction_params)
        format.html { redirect_to @group_transaction, notice: 'Group transaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @group_transaction }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @group_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /group_transactions/1 or /group_transactions/1.json
  def destroy
    @group_transaction.destroy
    respond_to do |format|
      format.html { redirect_to group_transactions_url, notice: 'Group transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_group_transaction
    @group_transaction = GroupTransaction.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def group_transaction_params
    params.require(:group_transaction).permit(:group_id, :user_transaction_id)
  end
end

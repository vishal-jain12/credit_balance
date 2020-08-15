class WalletTransactionsController < ApplicationController
  before_action :set_wallet_transaction, only: [:show, :edit, :update, :destroy]

  # GET /wallet_transactions
  # GET /wallet_transactions.json
  def index
    @wallet_transactions = WalletTransaction.all
  end

  # GET /wallet_transactions/1
  # GET /wallet_transactions/1.json
  def show
  end

  # GET /wallet_transactions/new
  def new
    @wallet_transaction = WalletTransaction.new
  end

  # GET /wallet_transactions/1/edit
  def edit
  end

  # POST /wallet_transactions
  # POST /wallet_transactions.json
  def create
    @wallet_transaction = WalletTransaction.new(wallet_transaction_params)

    respond_to do |format|
      if @wallet_transaction.save
        format.html { redirect_to @wallet_transaction, notice: 'Wallet transaction was successfully created.' }
        format.json { render :show, status: :created, location: @wallet_transaction }
      else
        format.html { render :new }
        format.json { render json: @wallet_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wallet_transactions/1
  # PATCH/PUT /wallet_transactions/1.json
  def update
    respond_to do |format|
      if @wallet_transaction.update(wallet_transaction_params)
        format.html { redirect_to @wallet_transaction, notice: 'Wallet transaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @wallet_transaction }
      else
        format.html { render :edit }
        format.json { render json: @wallet_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wallet_transactions/1
  # DELETE /wallet_transactions/1.json
  def destroy
    @wallet_transaction.destroy
    respond_to do |format|
      format.html { redirect_to wallet_transactions_url, notice: 'Wallet transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wallet_transaction
      @wallet_transaction = WalletTransaction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def wallet_transaction_params
      params.require(:wallet_transaction).permit(:amount, :type)
    end
end

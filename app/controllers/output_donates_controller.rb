class OutputDonatesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_output, only: [:destroy, :edit, :update]

  def index
    @outputs = OutputMoney.all
  end

  def new
    @output = OutputMoney.new
  end

  def create
    @output = OutputMoney.new(output_params)
    respond_to do |format|
      if @output.save
        format.html { redirect_to output_donates_path, notice: 'Tweet was successfully created.' }
        format.json { render :index, status: :created, location: @output }
      else
        format.html { redirect_to output_donates_path, alert: 'Failed to create tweet.' }
      end
    end
  end

  def edit
    respond_to do |format|
      format.js { render layout: false }
    end
  end

  def destroy
    @output.destroy
    respond_to do |format|
      format.html { redirect_to output_donates_path, notice: 'Data was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def update
    respond_to do |format|
      if @output.update(output_params)
        format.html { redirect_to output_donates_path, notice: 'Data was successfully updated.' }
        format.json { render :index, status: :ok, location: @output }
      else
        format.html { render :edit }
        format.json { render json: @output.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def set_output
    @output = OutputMoney.find(params[:id])
  end

  def output_params
    params.require(:output_money).permit(:date_used, :amount, :needs)
  end
end

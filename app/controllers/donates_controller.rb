class DonatesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_donate, only: [:destroy, :edit, :update]
  
  def index
    @donates = Donate.all
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @donate = Donate.new
  end

  def create
    @donate = Donate.new(donate_params)
    respond_to do |format|
      if @donate.save
        format.html { redirect_to root_path, notice: 'Tweet was successfully created.' }
        format.json { render :index, status: :created, location: @donate }
      else
        format.html { redirect_to root_path, alert: 'Failed to create tweet.' }
      end
    end
  end

  def edit
    respond_to do |format|
      format.js { render layout: false }
    end
  end

  def update
    respond_to do |format|
      if @donate.update(donate_params)
        format.html { redirect_to root_path, notice: 'Data was successfully updated.' }
        format.json { render :index, status: :ok, location: @donate }
      else
        format.html { render :edit }
        format.json { render json: @donate.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @donate.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Data was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def donate_params
    params.require(:donate).permit(:donator, :amount, :category, :date_donate)
  end

  def set_donate
    @donate = Donate.find(params[:id])
  end

end

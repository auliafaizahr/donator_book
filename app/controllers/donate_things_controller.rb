class DonateThingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_donate, only: [:destroy, :edit, :update]

  def index
    @donate_things = DonateThing.all
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @donate_thing = DonateThing.new
  end

  def create
    @donate_thing = DonateThing.new(donate_params)
    respond_to do |format|
      if @donate_thing.save
        format.html { redirect_to root_path, notice: 'Tweet was successfully created.' }
        format.json { render :index, status: :created, location: @donate_thing }
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

  def destroy
    @donate_thing.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Data was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def update
    respond_to do |format|
      if @donate_thing.update(donate_params)
        format.html { redirect_to root_path, notice: 'Data was successfully updated.' }
        format.json { render :index, status: :ok, location: @donate_thing }
      else
        format.html { render :edit }
        format.json { render json: @donate_thing.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def set_donate
    @donate_thing = DonateThing.find(params[:id])
  end

  def donate_params
    params.require(:donate_thing).permit(:donator, :amount, :category, :date_donate, :name, :image)
  end
end

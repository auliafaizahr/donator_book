class DonatesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_donate, only: [:destroy, :edit, :update, :download]
  before_action :set_donate_pdf, only: [:show]
  
  def index
    @donates = Donate.all
   
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    respond_to do |format|
      format.html { render layout: false }
      format.pdf do
        render pdf: "#{@donate.donator}_#{@donate.date_donate}",
        page_height: "15cm",
        page_width: "15cm",
        margin_top:     '10',
        margin_left:    '10',
        margin_right:   '10',
        margin_bottom:  '10',
        template: "donates/show.html.erb",
        layout: "donate_pdf.html.erb",
        lowquality: false,
        show_as_html: params.key?('debug'),
        page_size: nil
        
      end
    end
  end


  # def download
  #   binding.pry
  #   # kit = PDFKit.new(html, :page_size => 'Letter')
  
  #   kit = PDFKit.new"<h1>Hello</h1><p>This is PDF!!!</p>"
  #   # pdf = kit.to_pdf
  #   file = kit.to_file(Rails.root +  "#{@donate.donator}.pdf" )
  #   # kit.to_file("envato_invoice.pdf")
  #   respond_to do |format|
  #     format.pdf { render :text => PDFKit.new((donate)).to_pdf }
  #   end
  # end

  def new
    @donate = Donate.new
  end

  def create
    @donate = Donate.new(donate_params)
    respond_to do |format|
      if @donate.save
        format.html { redirect_to donates_path, notice: 'Tweet was successfully created.' }
        format.json { render :index, status: :created, location: @donate }
      else
        format.html { redirect_to donates_path, alert: 'Failed to create tweet.' }
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
        format.html { redirect_to donates_path, notice: 'Data was successfully updated.' }
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
      format.html { redirect_to donates_path, notice: 'Data was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def donate_params
    params.require(:donate).permit(:donator, :amount, :category, :date_donate)
  end

  def set_donate
    if params[:id]
      @donate = Donate.find(params[:id])
    else
      @donate = Donate.find(params[:donate_id])
    end
  end

  def set_donate_pdf
    result = params[:id].split("_")
    donator = result.first
    date = result.last
    donate = Donate.find_by(donator: donator, date_donate: date)
    params[:id] = donate.id
    @donate = Donate.find(params[:id])
  end

end

class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def index
    @donates_total = Donate.sum(:amount)
    @output_donates = OutputMoney.sum(:amount)
    @category = Donate.group(:category).sum(:amount)
    @category_thing = DonateThing.group(:category).sum(:amount)
  end
end

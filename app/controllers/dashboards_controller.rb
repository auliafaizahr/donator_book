class DashboardsController < ApplicationController
  def index
    @donates_total = Donate.sum(:amount)
    @output_donates = OutputMoney.sum(:amount)
  end
end

class VendorsController < ApplicationController
  def show
    @vendor = MarketMoneyFacade.new(params[:id]).vendor
  end
end
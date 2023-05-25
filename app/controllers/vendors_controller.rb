class VendorsController < ApplicationController
  def show
    @facade = MarketMoneyFacade.new(params[:id])
  end
end
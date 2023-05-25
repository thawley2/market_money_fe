class MarketsController < ApplicationController
  def index
    @facade = MarketMoneyFacade.new
  end

  def show
    @facade = MarketMoneyFacade.new(params[:id])
  end
end
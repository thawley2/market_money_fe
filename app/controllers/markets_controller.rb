class MarketsController < ApplicationController
  def index
    @facade = MarketMoneyFacade.new
  end
end
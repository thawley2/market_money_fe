class MarketsController < ApplicationController
  def index
    @facade = MarketsFacade.new
  end

  def show
    @facade = MarketsFacade.new(params[:id])
  end
end
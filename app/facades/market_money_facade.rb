class MarketMoneyFacade

  def initialize(id = nil)
    @id = id
  end

  def markets
    @_markets ||= markets_data.map do |market|
      Market.new(market)
    end
  end

  def market
    @_market ||= Market.new(market_data)
  end

  private
    def service
      @_service ||= MarketMoneyService.new
    end

    def markets_data
      @_markets_data ||= service.find_markets[:data]
    end

    def market_data
      @_market_data ||= service.find_market(@id)[:data]
    end
end
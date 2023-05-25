class MarketMoneyFacade

    def markets
      @_markets ||= markets_data.map do |market_data|
        Market.new(market_data)
      end
    end

  private
    def service
      @_service ||= MarketMoneyService.new
    end

    def markets_data
      @_markets_data ||= service.find_markets[:data]
    end
end
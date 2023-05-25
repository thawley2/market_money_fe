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

  def market_name
    market.name
  end

  def market_street
    market.street
  end

  def market_city_state_zip
    "#{market.city}, #{market.state} #{market.zip}"
  end

  def market_vendors
    @_market_vendors ||= market_vendors_data.map do |market_vendor|
      Vendor.new(market_vendor)
    end
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

    def market_vendors_data
      @_market_vendors_data ||= service.find_market_vendors(@id)[:data]
    end
end
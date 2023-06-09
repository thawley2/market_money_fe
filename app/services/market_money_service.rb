class MarketMoneyService

  def find_markets
    get_url('/api/v0/markets')
  end

  def find_market(id)
    get_url("/api/v0/markets/#{id}")
  end

  def find_market_vendors(id)
    get_url("/api/v0/markets/#{id}/vendors")
  end

  def find_vendor(id)
    get_url("/api/v0/vendors/#{id}")
  end

  def conn 
    Faraday.new(url: 'http://localhost:3000')
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
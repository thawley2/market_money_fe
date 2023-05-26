class VendorsFacade
  def initialize(id=nil)
    @id = id
  end

  def vendor
    @_vendor ||= Vendor.new(vendor_data)
  end

  def vendor_name
    vendor.name
  end

  def vendor_contact_name
    vendor.contact_name
  end

  def vendor_contact_phone
    vendor.contact_phone
  end

  def vendor_credit_accepted
    vendor.credit_accepted?
  end

  def vendor_description
    vendor.description
  end

  private
    def service
      @_service ||= MarketMoneyService.new
    end

    def vendor_data
      @_vendor_data ||= service.find_vendor(@id)[:data]
    end
end
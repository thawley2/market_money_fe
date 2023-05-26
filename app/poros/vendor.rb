class Vendor
  attr_reader :name, :description, :contact_name, :contact_phone, :credit_accepted, :id

  def initialize(data)
    @id = data[:id]
    @name = data[:attributes][:name]
    @description = data[:attributes][:description]
    @contact_name = data[:attributes][:contact_name]
    @contact_phone = data[:attributes][:contact_phone]
    @credit_accepted = data[:attributes][:credit_accepted]
  end

  def credit_accepted?
    if @credit_accepted
      'YES'
    else
      'NO'
    end
  end
end
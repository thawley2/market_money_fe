class VendorsController < ApplicationController
  def show
    @facade = VendorsFacade.new(params[:id])
  end
end
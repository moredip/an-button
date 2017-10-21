class DevicesController < ApplicationController
  protect_from_forgery

  def index
    @devices = Device.all
  end

  def show
    @device = Device.find_by_uid(params[:id])
  end
end

class DevicesController < ApplicationController
  def index
    @devices = Device.all
  end

  def heartbeat
  end
end

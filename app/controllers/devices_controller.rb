class DevicesController < ApplicationController
  protect_from_forgery except: :heartbeat

  def index
    @devices = Device.all
  end

  def show
    @device = Device.find_by_uid(params[:id])
  end

  def heartbeat
    device_uid = request.body.read
    logger.info('receiving heartbeat from: '+device_uid);

    Device
      .find_or_create_by_uid(device_uid)
      .record_heartbeat

    render plain: 'OK'
  end
end

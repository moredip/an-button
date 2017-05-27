class DevicesController < ApplicationController
  protect_from_forgery except: :heartbeat

  def index
    @devices = Device.all
  end

  def heartbeat
    device_uid = request.body.read
    logger.info('receiving heartbeat from: '+device_uid);

    @device = Device.first_or_create(uid:device_uid)

    render plain: 'OK'
  end
end

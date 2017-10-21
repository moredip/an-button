class DeviceApiController < ApplicationController
  skip_before_action :verify_authenticity_token

  def heartbeat
    extract_device_uid or return

    logger.info('receiving heartbeat from: '+@device_uid);

    Device
      .find_or_create_by_uid(@device_uid)
      .record_heartbeat

    render plain: 'OK'
  end

  def button
    extract_device_uid or return

    logger.info('receiving button press from: '+@device_uid);

    Device
      .find_by_uid!(@device_uid)
      .react_to_button_press

    render plain: 'OK'
  end

  private

  def extract_device_uid
    @device_uid = request.body.read
    if @device_uid.blank? 
      render status: 400, plain: 'empty body not allowed'
      return false
    else
      return true
    end

  end
end

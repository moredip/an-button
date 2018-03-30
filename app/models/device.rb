class Device < ApplicationRecord
  has_many :heartbeats, class_name: 'DeviceHeartbeat', dependent: :delete_all

  has_one :button_reactor, class_name: 'ButtonReactor'

  def self.find_or_create_by_uid(uid)
    find_or_create_by(uid:uid) do |device|
      device.description = uid
    end
  end

  def record_heartbeat
    logger.info("received a heartbeat from device ##{uid}")
    
    # disabling recording heartbeat since it was blowing through our Heroku data usage
    #heartbeats.create 
  end

  def react_to_button_press
    raise 'device has no button reactor registered' if button_reactor.nil? 
    button_reactor.react!
  end

  def last_heartbeat
    heartbeats.order(created_at: :desc, id: :desc).first&.created_at
  end
end

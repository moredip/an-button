class Device < ApplicationRecord
  has_many :heartbeats, class_name: 'DeviceHeartbeat', dependent: :delete_all

  def self.find_or_create_by_uid(uid)
    find_or_create_by(uid:uid) do |device|
      device.description = uid
    end
  end

  def record_heartbeat
    heartbeats.create
  end

  def last_heartbeat
    heartbeats.order(created_at: :desc, id: :desc).first.created_at
  end
end

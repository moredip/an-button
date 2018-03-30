require 'json'

class ButtonReactor < ApplicationRecord
  def react!
    case self.reaction_strategy
    when 'call_phone'
      self.call_phone(self.reaction_param)
    when 'find_my_iphone'
      self.find_my_iphone(self.reaction_param)
    else
      raise "unrecognized reaction strategy #{self.reaction_strategy}"
    end
  end

  def call_phone(number)
    tc = TwilioClient.new
    tc.call_phone(number)
  end

  def find_my_iphone(username_and_password_and_device)
    username,password,deviceId = JSON.parse(username_and_password_and_device)
    locator = IOSDeviceLocator.new( username, password )
    locator.playSound(deviceId,'Button Calling')
  end
end

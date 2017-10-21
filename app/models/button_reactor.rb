class ButtonReactor < ApplicationRecord
  def react!
    raise "unrecognized reaction strategy #{self.reaction_strategy}" unless self.reaction_strategy == 'call_phone'
    self.call_phone(self.reaction_param)
  end

  def call_phone(number)
    tc = TwilioClient.new
    tc.call_phone(number)
  end
end

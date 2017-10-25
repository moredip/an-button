class TwilioClient
  def initialize
    @outgoing_number = env_or_bust('TWILIO_OUTGOING_NUMBER')

    @client = Twilio::REST::Client.new(
      env_or_bust('TWILIO_ACCOUNT_SID'),
      env_or_bust('TWILIO_AUTH_TOKEN')
    )
  end

  def send_sms(number)
    message = @client.messages.create(
      body: "Hello from Ruby",
      from: @outgoing_number,
      to: number
    )
    puts message.sid
  end

  def call_phone(number)
    call = @client.calls.create(
      from: @outgoing_number,
      to: number,
      url: 'http://twimlets.com/message?Message%5B0%5D=Thanks%20for%20using%20An%20Button!%20Have%20a%20nice%20day.',
      machine_detection: 'Enable'
    )
    puts call.sid
  end

  private

  def env_or_bust(key)
    raise "no #{key} env var provided" unless ENV.has_key?(key)
    ENV[key]
  end
end

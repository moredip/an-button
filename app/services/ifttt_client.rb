require 'cgi'
require 'typhoeus'

class IftttClient
  def initialize key
    @key = key
  end
    
  def trigger_event(event_name)
    url = "https://maker.ifttt.com/trigger/#{CGI.escape(event_name)}/with/key/#{@key}"
    puts "triggering IFTTT webhook via #{url}"
    response = Typhoeus.post(url)
    puts "IFTTT responded with #{response.code}"
    puts response.body
  end
end

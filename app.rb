require 'sinatra'

class MonitorIOT < Sinatra::Base
  get '/healthcheck' do
    "Hi there!"
  end

end

require 'sinatra'
require 'haml'

class MonitorIOT < Sinatra::Base
  get '/healthcheck' do
    "Hi there!"
  end

  get '/upload' do
    haml :upload
  end

  post "/:id/upload" do 
    File.open("uploads/#{params[:id]}.jpg", "w") do |f|
      f.write(params['reading'][:tempfile].read)
    end
    return "Reading uploaded"
  end
end


require 'sinatra'
require 'haml'
#require 'tesseract'

class MonitorIOT < Sinatra::Base
  get '/healthcheck' do
    "Hi there!"
  end

  get '/upload' do
    haml :upload
  end

  post "/:id/upload" do 
#    require 'pry'; binding.pry
    filename = "uploads/#{params[:id]}.tif"
    File.open("1.tif", "w") do |f|
      f.write(params['reading'][:tempfile].read)
    end
    system("tesseract 1.tif output nobatch digits")
#    e = Tesseract::Engine.new
#    return e.text_for("uploads/#{params[:id]}.tif").strip
    result = File.read('output.txt') rescue "nil"
    return result
  end
end


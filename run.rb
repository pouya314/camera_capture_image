require 'av_capture'

session = AVCapture::Session.new
dev     = AVCapture.devices.find(&:video?)

p dev.name
p dev.video?

session.run_with(dev) do |connection|
  2.times do |i|
    File.open("x_#{i}.jpg", 'wb') { |f|
      f.write connection.capture
    }
    sleep 1
  end
end

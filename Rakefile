require 'rubygems'
require 'rake'
require 'echoe'

Echoe.new('mobile_app', '0.1.0') do |p|
  p.description    = "Allow your app to support mobile devices"
  p.url            = "http://github.com/dwaynemac/mobile_app"
  p.author         = "Dwayne Macgowan"
  p.email          = "dwaynemac@gmail.com"
  p.ignore_pattern = ["tmp/*", "script/*"]
  p.development_dependencies = []
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each{|ext| load ext }

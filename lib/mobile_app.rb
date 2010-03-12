require 'mobile_app/mobile_app'
require 'mobile_app/jqtouch_helper'

Mime::Type.register_alias "text/html", :mobile

class ActionController::Base
  include MobileApp
end

class ActionView::Base
  include MobileApp::JQTouchHelper
end
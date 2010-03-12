require 'mobile_app/mobile_app'
require 'mobile_app/jqtouch_helper'

Mime::Type.register_alias "text/html", :mobile

ActionController::Base.send(:include, MobileApp)
ActionView::Base.send(:include, MobileApp::JqtouchHelper)
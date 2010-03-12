# Author::    Dwayne Macgowan
# Copyright:: Copyright (c) 2010
# License::
#
module MobileApp
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def responds_to_mobile(*args, &block)
      #default options
      options = {}
      options.merge!(args.pop) if args.last.kind_of?(Hash)

      if options.delete(:test_mode){false}
        before_filter(:force_mobile)
      else
        before_filter(:prepare_for_mobile)
      end
      helper_method :mobile_device?

      send :include, InstanceMethods
    end
  end

  module InstanceMethods
    def mobile_device?
      if session[:mobile_param]
        session[:mobile_param] == "1"
      else
        request.user_agent =~ /Mobile|webOS/
      end
    end

    def prepare_for_mobile
      session[:mobile_param] = params[:mobile] if params[:mobile]
    end

    def force_mobile
      
    end
  end
end
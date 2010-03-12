#
# JQtouch helpers for JQTouch version 1.0-b2
#
module MobileApp::JQTouchHelper
  #
  # Mobile back button
  # <tt>mobile_back_button(text,url,options)</tt>
  #   prints:  <a href="+url+" class="back">+text+</a>
  #
  def mobile_back_button(text,url,options)
    link_to( text, url, options.merge!({:class => "back"}))
  end

  #
  # = Mobile Toolbar
  #
  # mobile_toolbar(title, options, &block)
  # == Parameters
  #   <tt>title</tt>: h1 title for the toolbar
  # == Valid options
  #   <tt>back_button</tt>: includes mobile_back_button on toolbar
  def mobile_toolbar(title, options={}, &block)
    raise "Block needed" unless block_given?
    concat build_toolbar(title, options, &block)
  end

  def mobile_button(text, url, options={})
    link_to text, url, options.merge!({:class => "button", :rel => "external"})
  end

  private

    def build_toolbar(title, options = {}, &block)
      proc = block_given? ? capture(&block) : ""
      back = options.delete(:back_button)
      right_button = options.delete(:right_button)
      html = back ? mobile_back_button(back) : ""
      html << right_button ? right_button : ""

      content_tag :div,
        content_tag(:h1, title) + proc + html,
        :class => 'toolbar'
    end
end
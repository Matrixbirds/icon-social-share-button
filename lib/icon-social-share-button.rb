require "icon_social_share_button/version"
require "icon_social_share_button/config"
require "icon_social_share_button/helper"

I18n.load_path += Dir.glob( File.dirname(__FILE__) + "lib/locales/*.{rb,yml}" )

module IconSocialShareButton
  module Rails
    if ::Rails.version < "3.1"
      require "icon_social_share_button/railtie"
    else
      require "icon_social_share_button/engine"
    end
  end
end

ActionView::Base.send :include, IconSocialShareButton::Helper

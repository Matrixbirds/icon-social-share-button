# coding: utf-8
require 'rqrcode'
module IconSocialShareButton
  module Helper
    def icon_social_share_button_tag(title = "", opts = {})
      extra_data = {}
      rel = opts[:rel]
      html = []
      html << "<div class='icon-social-share-button' id='#{opts[:id]}' data-title='#{h title}' data-img='#{opts[:image]}'"
      html << "data-url='#{opts[:url]}' data-desc='#{opts[:desc]}' data-popup='#{opts[:popup]}' data-via='#{opts[:via]}'>"

      IconSocialShareButton.config.allow_sites.each do |name|
        extra_data = opts.select { |k, _| k.to_s.start_with?('data') } if name.eql?('tumblr')
        special_data = opts.select { |k, _| k.to_s.start_with?('data-' + name) }

        link_title = t "icon_social_share_button.share_to", :name => t("icon_social_share_button.#{name.downcase}")
        html << link_to("","#", {:rel => ["nofollow", rel],
                                  "data-site" => name,
                                  :class => "generial-iconfont icon-social-share-button-#{name}",
                                  :onclick => "return IconSocialShareButton.share(this);",
                                  :title => h(link_title)}.merge(extra_data).merge(special_data))
      end
      html << "</div>"
      raw html.join("\n")
    end

    def generate_qr_code(url)
      if url
        RQRCode::QRCode.new(url, :size => 4, :level => :h)
      else
        raise "url must not be nil"
      end
    end

   def wechat_image_tag(opts = {})
     default_img_options = {
       :class => 'default-wechat-share-style',
       :size => 250,
       :url => 'https://github.com/Matrixbirds/icon-social-share-button'
     }
     options = default_img_options.merge(opts) # reverse_merge
     image_tag generate_qr_code(options[:url]).as_png(:size => options[:size]).to_data_url
   end

  end
end
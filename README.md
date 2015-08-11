# Social Share Button

This gem is forks from [social-share-button]()
It used to share url to chinese social apps

# Support Apps list

* Weibo
* QZone
* Tencent Weibo
* QQ Friend
* Wechat(weixin)
## Screenshot

## Install

In your `Gemfile`:

```ruby
gem 'icon-social-share-button'
```

And install it:

```bash
$ bundle install
$ rails generate icon_social_share_button:install
```

## Configure

You can config `config/initializes/icon_social_share_button.rb` to choose which site do you want to use:

```ruby
IconSocialShareButton.configure do |config|
  config.allow_sites = %w(weibo tqq qq qqzone wechat)
end
```

## Usage

You need add require css,js file in your app assets files:

`app/assets/javascripts/application.js`

```
//= require icon-social-share-button
```

```sh
mkdir /to/your_app_project_path/app/assets/fonts
cp fonts/* /to/your_app_project_path/app/assets/fonts
```

`app/assets/stylesheets/application.css.scss`

```scss
/* You can extend css base on the below code */
@font-face {font-family: "generial-iconfont";
   src: font-url('iconfont.eot'); /* IE9*/
   src: font-url('iconfont.eot?#iefix') format('embedded-opentype'), /* IE6-IE8 */
   font-url('iconfont.woff') format('woff'), /* chrome、firefox */
   font-url('iconfont.ttf') format('truetype'), /* chrome、firefox、opera、Safari, Android, iOS 4.2+*/
   font-url('iconfont.svg#iconfont') format('svg'); /* iOS 4.1- */
 }

 .generial-iconfont {
   font-family:"generial-iconfont" !important;
   font-size:18px;
   font-style:normal;
   line-height:15px;
   -webkit-font-smoothing: antialiased;
   -webkit-text-stroke-width: 0.2px;
   -moz-osx-font-smoothing: grayscale;
 }

 .social-share-button {
     position: relative;
     left: 50px;
     top: 5px;
 }

 .social-share-button a {
   margin: auto 10px;
 }

 .icon-social-share-button-qqzone:before {
     content: "\e605";
     background-color: #E9AC40;
     border-radius: 5px;
     font-size: 38px;
     display: inline-block;
     padding: 2px;
     color: #FFF;
     text-decoration: blink;
     line-height: 38px;
 }

 .icon-social-share-button-tqq:before {
     content: "\e607";
     background-color: #40B6CA;
     border-radius: 5px;
     font-size: 38px;
     display: inline-block;
     padding: 2px;
     color: #FFF;
     text-decoration: blink;
     line-height: 38px;
 }

 .icon-social-share-button-qq:before {
     content: "\e601";
     background-color: #338edd;
     border-radius: 5px;
     font-size: 38px;
     display: inline-block;
     padding: 2px;
     color: #FFF;
     text-decoration: blink;
     line-height: 38px;
 }

 .icon-social-share-button-weibo:before {
     content: "\e603";
     background-color: #BE3724;
     border-radius: 5px;
     font-size: 38px;
     display: inline-block;
     padding: 2px;
     color: #FFF;
     text-decoration: blink;
     line-height: 38px;
 }

```

Then you can use `icon_social_share_button_tag` helper in views, for example `app/views/posts/show.html.erb`

Generate icon_social_share_button on views
```erb
<%= icon_social_share_button_tag '23333', :url => request.original_url, :desc => '😄哈哈哈哈哈哈哈' %>
```

Generate Qr_code on views
Default url is this repository
```erb
<%= wechat_image_tag  %>
```

# encoding: utf-8
class WenxinController < ApplicationController
  def access
    access_message = AccessMessage.new(params)

    if access_message.valid? && access_message.is_valid?
      render :text => access_message.echostr
    else
      render :text => "Access deny"
    end
  end

  def push
    begin
      push_message = PushMessage.parse_and_create params
      @reply_message = TextPushMessage.new :to_user_name => push_message.from_user_name,
                                           :from_user_name => push_message.to_user_name,
                                           :function_flag => "0"
      message_handler!(push_message)
      output_string = @reply_message.response_to_xml
      Rails.logger.info "xml => #{output_string}"
      render :text => output_string
    rescue Exception => exc
      render :text => exc.message
    end

  end

  def message_handler!(push_message)
    case push_message.message_type.to_sym
      when :text
        @reply_message.message_type = "text"
        text_message_handler! push_message
      when :image
        @reply_message.message_type = "text"
        @reply_message.content =sprintf(ENV['TEXT_REPLY_MESSAGE'], "图片")
      when :location
        @reply_message.message_type = "text"
        @reply_message.content =sprintf(ENV['TEXT_REPLY_MESSAGE'], "地理位置")
      when :link
        @reply_message.message_type = "text"
        @reply_message.content =sprintf(ENV['TEXT_REPLY_MESSAGE'], "链接")
      when :event
        @reply_message.message_type = "text"
        @reply_message.content =sprintf(ENV['TEXT_REPLY_MESSAGE'], "事件")
      when :voice
        @reply_message.message_type = "text"
        @reply_message.content =sprintf(ENV['TEXT_REPLY_MESSAGE'], "语音")
    end
  end

  def text_message_handler!(push_message)
    case push_message.content
      when "图文"
        articles = [
            {:title => "图片或视频分享能挽救Facebook们吗？",
             :description => "强关系网络的发展进入迷茫期，国内外皆然",
             :picture_url => "http://u.img.huxiu.com/portal/201306/21/070343c14ffdj4jlqlx4jz.jpg",
             :url => "http://www.huxiu.com/article/16175/1.html"
            }
        ]
        @reply_message = NewsPushMessage.new :to_user_name => push_message.from_user_name,
                                             :from_user_name => push_message.to_user_name,
                                             :message_type => "news",
                                             :article_count => "1",
                                             :articles => articles,
                                             :function_flag => "1"
      else
        @reply_message.content =sprintf(ENV['TEXT_REPLY_MESSAGE'], push_message.content)
    end
  end
end

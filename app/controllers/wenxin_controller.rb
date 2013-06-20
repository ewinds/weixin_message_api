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
      push_message = TextMessage.parse_and_create params
      @reply_message = TextMessage.new :to_user_name => push_message.from_user_name,
                                       :from_user_name => push_message.to_user_name,
                                       :message_type => "text",
                                       :content => "this is a reply for: #{push_message.content}",
                                       :function_flag => "0"
      output_string = @reply_message.to_response_xml
      Rails.logger.info "xml => #{output_string}"
      render :text => output_string
    rescue Exception => exc
      render :text => exc.message
    end

  end
end

require 'spec_helper'

describe TextPushMessage do

  before(:each) do
    @parameters = {"xml" =>
                      {"ToUserName" => "gh_43ae8ce8965f",
                       "FromUserName" => "o-yiqjpzPNENWiC1iC4cdyWqKAV4",
                       "CreateTime" => "1371692921",
                       "MsgType" => "text",
                       "Content" => "This is a test",
                       "MsgId" => "5891376235849711623"},
                  "signature" => "13c86228e8b79fc0446818beb8c46fddec4bebf4",
                  "timestamp" => "1371692921",
                  "nonce" => "1372084980"}

    @attr = {
        :to_user_name => "toUser",
        :from_user_name => "fromUser",
        :message_type => "text",
        :content => "this is a reply",
        :function_flag => "0"
    }
  end

  describe "receive text message" do
    it "should create a new instance given a valid xml" do
      text_message = PushMessage.parse_and_create(@parameters)
      text_message.should be_valid
      text_message.to_user_name.should eq("gh_43ae8ce8965f")
      text_message.from_user_name.should eq("o-yiqjpzPNENWiC1iC4cdyWqKAV4")
      text_message.create_time.should eq("1371692921")
      text_message.message_type.should eq("text")
      text_message.content.should eq("This is a test")
      text_message.message_id.should eq("5891376235849711623")
    end
  end

  describe "reply text message" do
    it "should create a xml string given params" do
      reply_text_message = TextPushMessage.new(@attr)
      xml_string = reply_text_message.response_to_xml
      xml_string.should match /^<xml>.*<\/xml>$/i
    end
  end
end
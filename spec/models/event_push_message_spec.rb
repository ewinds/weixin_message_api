require 'spec_helper'

describe EventPushMessage do
  before(:each) do
    @parameters = {"xml" =>
                       {"ToUserName" => "gh_43ae8ce8965f",
                        "FromUserName" => "o-yiqjpzPNENWiC1iC4cdyWqKAV4",
                        "CreateTime" => "1371692921",
                        "MsgType" => "event",
                        "Event" => "Event",
                        "EventKey" => "EventKey",
                        "MsgId" => "5891376235849711623"},
                   "signature" => "13c86228e8b79fc0446818beb8c46fddec4bebf4",
                   "timestamp" => "1371692921",
                   "nonce" => "1372084980"}
  end

  describe "receive event message" do
    it "should create a new instance given a valid xml" do
      event_message = PushMessage.parse_and_create(@parameters)
      event_message.should be_valid
      event_message.to_user_name.should eq("gh_43ae8ce8965f")
      event_message.from_user_name.should eq("o-yiqjpzPNENWiC1iC4cdyWqKAV4")
      event_message.create_time.should eq("1371692921")
      event_message.message_type.should eq("event")
      event_message.event.should eq("Event")
      event_message.event_key.should eq("EventKey")
      event_message.message_id.should eq("5891376235849711623")
    end
  end
end
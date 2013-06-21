require 'spec_helper'

describe LocationPushMessage do
  before(:each) do
    @parameters = {"xml" =>
                       {"ToUserName" => "gh_43ae8ce8965f",
                        "FromUserName" => "o-yiqjpzPNENWiC1iC4cdyWqKAV4",
                        "CreateTime" => "1371692921",
                        "MsgType" => "location",
                        "Location_X" => "23.134521",
                        "Location_Y" => "113.358803",
                        "Scale" => "20",
                        "Label" => "location",
                        "MsgId" => "5891376235849711623"},
                   "signature" => "13c86228e8b79fc0446818beb8c46fddec4bebf4",
                   "timestamp" => "1371692921",
                   "nonce" => "1372084980"}
  end

  describe "receive location message" do
    it "should create a new instance given a valid xml" do
      location_message = PushMessage.parse_and_create(@parameters)
      location_message.should be_valid
      location_message.to_user_name.should eq("gh_43ae8ce8965f")
      location_message.from_user_name.should eq("o-yiqjpzPNENWiC1iC4cdyWqKAV4")
      location_message.create_time.should eq("1371692921")
      location_message.message_type.should eq("location")
      location_message.location_x.should eq("23.134521")
      location_message.location_y.should eq("113.358803")
      location_message.scale.should eq("20")
      location_message.label.should eq("location")
      location_message.message_id.should eq("5891376235849711623")
    end
  end
end
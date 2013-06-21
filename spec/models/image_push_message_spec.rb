require 'spec_helper'

describe ImagePushMessage do
  before(:each) do
    @parameters = {"xml" =>
                       {"ToUserName" => "gh_43ae8ce8965f",
                        "FromUserName" => "o-yiqjpzPNENWiC1iC4cdyWqKAV4",
                        "CreateTime" => "1371692921",
                        "MsgType" => "image",
                        "PicUrl" => "This is a test",
                        "MsgId" => "5891376235849711623"},
                   "signature" => "13c86228e8b79fc0446818beb8c46fddec4bebf4",
                   "timestamp" => "1371692921",
                   "nonce" => "1372084980"}
  end

  describe "receive image message" do
    it "should create a new instance given a valid xml" do
      image_message = PushMessage.parse_and_create(@parameters)
      image_message.should be_valid
      image_message.to_user_name.should eq("gh_43ae8ce8965f")
      image_message.from_user_name.should eq("o-yiqjpzPNENWiC1iC4cdyWqKAV4")
      image_message.create_time.should eq("1371692921")
      image_message.message_type.should eq("image")
      image_message.picture_url.should eq("This is a test")
      image_message.message_id.should eq("5891376235849711623")
    end
  end
end
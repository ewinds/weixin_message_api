require 'spec_helper'

describe LinkPushMessage do
  before(:each) do
    @parameters = {"xml" =>
                       {"ToUserName" => "gh_43ae8ce8965f",
                        "FromUserName" => "o-yiqjpzPNENWiC1iC4cdyWqKAV4",
                        "CreateTime" => "1371692921",
                        "MsgType" => "link",
                        "Title" => "title",
                        "Description" => "something",
                        "Url" => "location",
                        "MsgId" => "5891376235849711623"},
                   "signature" => "13c86228e8b79fc0446818beb8c46fddec4bebf4",
                   "timestamp" => "1371692921",
                   "nonce" => "1372084980"}
  end

  describe "receive link message" do
    it "should create a new instance given a valid xml" do
      link_message = PushMessage.parse_and_create(@parameters)
      link_message.should be_valid
      link_message.to_user_name.should eq("gh_43ae8ce8965f")
      link_message.from_user_name.should eq("o-yiqjpzPNENWiC1iC4cdyWqKAV4")
      link_message.create_time.should eq("1371692921")
      link_message.message_type.should eq("link")
      link_message.title.should eq("title")
      link_message.description.should eq("something")
      link_message.url.should eq("location")
      link_message.message_id.should eq("5891376235849711623")
    end
  end
end
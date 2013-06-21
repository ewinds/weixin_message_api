require 'spec_helper'

describe VoicePushMessage do
  before(:each) do
    @parameters = {"xml" =>
                       {"ToUserName" => "gh_43ae8ce8965f",
                        "FromUserName" => "o-yiqjpzPNENWiC1iC4cdyWqKAV4",
                        "CreateTime" => "1371692921",
                        "MsgType" => "voice",
                        "MediaId" => "zZ9abLwB_5h5FD8GILSScNrydwOtYPORvt7EIGwN4W2GMqSIcNeCc82SrfDIH5pK",
                        "Format" => "amr",
                        "Recognition" => "",
                        "MsgId" => "5891376235849711623"},
                   "signature" => "13c86228e8b79fc0446818beb8c46fddec4bebf4",
                   "timestamp" => "1371692921",
                   "nonce" => "1372084980"}
  end

  describe "receive voice message" do
    it "should create a new instance given a valid xml" do
      voice_message = PushMessage.parse_and_create(@parameters)
      voice_message.should be_valid
      voice_message.to_user_name.should eq("gh_43ae8ce8965f")
      voice_message.from_user_name.should eq("o-yiqjpzPNENWiC1iC4cdyWqKAV4")
      voice_message.create_time.should eq("1371692921")
      voice_message.message_type.should eq("voice")
      voice_message.media_id.should eq("zZ9abLwB_5h5FD8GILSScNrydwOtYPORvt7EIGwN4W2GMqSIcNeCc82SrfDIH5pK")
      voice_message.format.should eq("amr")
      voice_message.recognition.should eq("")
      voice_message.message_id.should eq("5891376235849711623")
    end
  end
end
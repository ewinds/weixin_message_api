require 'spec_helper'

describe WenxinController do
  render_views

  before(:each) do
    @text_parameters = {"xml" =>
                            {"ToUserName" => "gh_43ae8ce8965f",
                             "FromUserName" => "o-yiqjpzPNENWiC1iC4cdyWqKAV4",
                             "CreateTime" => "1371692921",
                             "MsgType" => "text",
                             "Content" => "This is a test",
                             "MsgId" => "5891376235849711623"},
                        "signature" => "13c86228e8b79fc0446818beb8c46fddec4bebf4",
                        "timestamp" => "1371692921",
                        "nonce" => "1372084980",
                        "echostr" => "5891039065108718591"}
  end

  describe "GET 'message'" do
    it "returns http success" do
      get :access, @text_parameters
      expect(response).to be_success
      expect(response.status).to eq(200)
      expect(response.body).to match /5891039065108718591/m
    end

    it "returns http success with error message" do
      get :access
      expect(response).to be_success
      expect(response.status).to eq(200)
      expect(response.body).to match /Access deny/m
    end
  end

  describe "POST 'message'" do
    it "returns xml data success" do
      post :push, @text_parameters
      expect(response).to be_success
      expect(response.status).to eq(200)
      expect(response.body).to match /<xml>.+This is a test.+<\/xml>/m
    end
  end
end

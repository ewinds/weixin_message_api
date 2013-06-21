require 'spec_helper'

describe NewsPushMessage do
  before(:each) do
    @attr = {
        :to_user_name => "toUser",
        :from_user_name => "fromUser",
        :message_type => "news",
        :article_count => "2",
        :articles => [
            {:title => "title1",
             :description => "description1",
             :picture_url => "picurl1",
             :url => "url1"
            },
            {:title => "title2",
             :description => "description2",
             :picture_url => "picurl2",
             :url => "url2"
            }
        ],
        :function_flag => "1"
    }
  end

  describe "reply news message" do
    it "should create a xml string given params" do
      reply_news_message = NewsPushMessage.new(@attr)
      xml_string = reply_news_message.response_to_xml
      xml_string.should match /^<xml>.+<Articles><item>.+<item>.+<\/Articles>.+<\/xml>$/m
    end
  end
end
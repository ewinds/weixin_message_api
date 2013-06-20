require 'spec_helper'

describe AccessMessage do
  before(:each) do
    @parameters = {"signature" => "c366868405c3f5da2c59cd5179caffa9cbbe257a",
                  "echostr" => "5891039065108718591",
                  "timestamp" => "1371612159",
                  "nonce" => "1371614411"}
  end

  it "should accept access given valid parameters" do
    accept_message = AccessMessage.new(@parameters)
    expect(accept_message.is_valid?).to be_true
  end

  it "should reject access given invalid parameters" do
    accept_message = AccessMessage.new(@parameters.merge!("signature" => "wrong"))
    expect(accept_message.is_valid?).to be_false
  end

  it "should not be blank given parameters" do
    accept_message = AccessMessage.new(@parameters.merge!("signature" => ""))
    expect(accept_message.valid?).to be_false
  end
end
require 'spec_helper'

describe WenxinController do

  describe "GET 'message'" do
    it "returns http success" do
      get 'message'
      response.should be_success
    end
  end

end

require 'digest/sha1'

class WenxinController < ApplicationController
  def show
    signature = params[:signature]
    timestamp = params[:timestamp]
    nonce = params[:nonce]
    echostr = params[:echostr]
    token = ENV['WENXIN_TOKEN'].dup

    array = [token, timestamp, nonce]
    tmp_str = Digest::SHA1.hexdigest array.sort.join

    if tmp_str == signature
      render :text => echostr
    else
      render :nothing => true
    end
  end

  def create
  end
end

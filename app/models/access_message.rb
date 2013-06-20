require 'digest/sha1'

class AccessMessage
  include ActiveAttr::Model
  attr_accessor :signature, :timestamp, :nonce, :echostr
  validates_presence_of :signature, :timestamp, :nonce, :echostr

  def is_valid?
    token = ENV['WENXIN_TOKEN'].dup
    array = [token, timestamp, nonce]
    tmp_str = Digest::SHA1.hexdigest array.sort.join
    tmp_str == signature
  end
end
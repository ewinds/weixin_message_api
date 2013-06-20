require "rexml/document"
require "rexml/xpath"
include REXML

class PushMessage
  include ActiveAttr::Model
  attribute :create_time, :default => Time.now.to_i
  attr_accessor :to_user_name, :from_user_name, :message_type, :message_id, :function_flag
  validates_presence_of :to_user_name, :from_user_name, :create_time, :message_type, :message_id

  def self.parse_and_create(parameters)
    access_message = AccessMessage.new(parameters)
    raise "Access deny" unless access_message.is_valid?

    logger.debug "Post message accepted."

    hash = {}
    hash.merge!(:to_user_name => parameters['xml']['ToUserName'])
    hash.merge!(:from_user_name => parameters['xml']['FromUserName'])
    hash.merge!(:create_time => parameters['xml']['CreateTime'])
    hash.merge!(:message_type => parameters['xml']['MsgType'])
    hash.merge!(:message_id => parameters['xml']['MsgId'])
    hash = parse!(hash, parameters['xml'])

    new(hash)
  end

  def self.parse!(hash, parameters)

  end
end
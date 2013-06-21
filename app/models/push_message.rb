require "rexml/document"
require "rexml/xpath"
include REXML

class PushMessage
  include ActiveAttr::Model
  attribute :create_time, :default => Time.now.to_i
  attr_accessor :to_user_name, :from_user_name, :message_type, :message_id, :function_flag
  validates_presence_of :to_user_name, :from_user_name, :create_time, :message_type, :message_id

  SUB_CLASS_NAME = "%s_push_message"

  def self.parse_and_create(parameters)
    access_message = AccessMessage.new(parameters)
    raise "Access deny" unless access_message.is_valid?
    Rails.logger.debug "Post message accepted."

    create_subclass(parameters['xml']['MsgType']).create(parameters)
  end

  def self.create_subclass(name)
    classified_name = sprintf(SUB_CLASS_NAME, name).to_s.split('_').collect! { |w| w.capitalize }.join
    Object.const_get(classified_name)
  end

  def self.create(parameters)
    hash = {}
    hash.merge!(:to_user_name => parameters['xml']['ToUserName'])
    hash.merge!(:from_user_name => parameters['xml']['FromUserName'])
    hash.merge!(:create_time => parameters['xml']['CreateTime'])
    hash.merge!(:message_type => parameters['xml']['MsgType'])
    hash.merge!(:message_id => parameters['xml']['MsgId'])
    hash = parse!(hash, parameters['xml'])

    new hash
  end

  def self.parse!(hash, parameters)

  end
end
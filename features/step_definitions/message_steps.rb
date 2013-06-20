# encoding: utf-8
begin
  require 'rspec/expectations';
rescue LoadError;
  require 'spec/expectations';
end
require 'cucumber/formatter/unicode'
$:.unshift(File.dirname(__FILE__) + '/../../lib')

Before do
  @message = AccessMessage.new
end

Given /GET请求中参数signature是 (.*)/ do |param|
  @message.signature = param
end

Given /GET请求中参数timestamp是 (.*)/ do |param|
  @message.timestamp = param
end

Given /GET请求中参数nonce是 (.*)/ do |param|
  @message.nonce = param
end

Given /GET请求中参数echostr是 (.*)/ do |param|
  @message.echostr = param
end

Given /消息接口持有token是 (.*)/ do |param|
  @token = param
end

When /收到GET请求/ do
  visit "/wenxin/message?signature=#{@message.signature}&timestamp=#{@message.timestamp}&nonce=#{@message.nonce}&echostr=#{@message.echostr}"
end

Then /页面显示 (.*)/ do |param|
  page.html == param
end

Then /页面显示空白/ do
  page.html == ''
end
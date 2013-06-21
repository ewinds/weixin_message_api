require 'builder/xmlmarkup'

class TextPushMessage < PushMessage
  attr_accessor :content
  validates_presence_of :content

  def self.parse!(hash, parameters)
    hash.merge!(:content => parameters['Content'])
  end

  def response_to_xml
    doc = Builder::XmlMarkup.new(:target => out_string = "", :indent => 0)
    doc.xml {
      doc.ToUserName { doc.cdata!(to_user_name) }
      doc.FromUserName { doc.cdata!(from_user_name) }
      doc.CreateTime(create_time)
      doc.MsgType { doc.cdata!(message_type) }
      doc.Content { doc.cdata!(content) }
      doc.FuncFlag(function_flag)
    }
    out_string
  end
end
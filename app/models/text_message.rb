require 'builder/xmlmarkup'

class TextMessage < PushMessage
  attr_accessor :content
  validates :content, :presence => true

  def self.parse!(hash, parameters)
    hash.merge(:content => parameters['Content'])
  end

  def to_response_xml
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
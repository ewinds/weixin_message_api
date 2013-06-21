class NewsPushMessage < PushMessage
  attr_accessor :article_count, :articles
  validates_presence_of :article_count, :articles

  def response_to_xml
    doc = Builder::XmlMarkup.new(:target => out_string = "", :indent => 0)
    doc.xml {
      doc.ToUserName { doc.cdata!(to_user_name) }
      doc.FromUserName { doc.cdata!(from_user_name) }
      doc.CreateTime(create_time)
      doc.MsgType { doc.cdata!(message_type) }
      doc.ArticleCount(article_count)
      doc.Articles {
        articles.each { |element_data|
          doc.item {
            doc.Title { doc.cdata!(element_data[:title]) }
            doc.Description { doc.cdata!(element_data[:description]) }
            doc.PicUrl { doc.cdata!(element_data[:picture_url]) }
            doc.Url { doc.cdata!(element_data[:url]) }
          }
        }
      }
      doc.FuncFlag(function_flag)
    }
    out_string
  end
end
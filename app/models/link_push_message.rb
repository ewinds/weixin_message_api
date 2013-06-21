class LinkPushMessage < PushMessage
  attr_accessor :title, :description, :url
  validates_presence_of :title, :description, :url

  def self.parse!(hash, parameters)
    hash.merge!(:title => parameters['Title'])
    hash.merge!(:description => parameters['Description'])
    hash.merge!(:url => parameters['Url'])
  end
end
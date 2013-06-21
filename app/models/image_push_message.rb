class ImagePushMessage < PushMessage
  attr_accessor :picture_url
  validates_presence_of :picture_url

  def self.parse!(hash, parameters)
    hash.merge!(:picture_url => parameters['PicUrl'])
  end
end
class VoicePushMessage < PushMessage
  attr_accessor :media_id, :format, :recognition
  validates_presence_of :media_id, :format

  def self.parse!(hash, parameters)
    hash.merge!(:media_id => parameters['MediaId'])
    hash.merge!(:format => parameters['Format'])
    hash.merge!(:recognition => parameters['Recognition'])
  end
end
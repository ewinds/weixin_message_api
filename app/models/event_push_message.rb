class EventPushMessage < PushMessage
  attr_accessor :event, :event_key
  validates_presence_of :event, :event_key

  def self.parse!(hash, parameters)
    hash.merge!(:event => parameters['Event'])
    hash.merge!(:event_key => parameters['EventKey'])
  end
end
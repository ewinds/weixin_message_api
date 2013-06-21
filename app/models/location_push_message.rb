class LocationPushMessage < PushMessage
  attr_accessor :location_x, :location_y, :scale, :label
  validates_presence_of :location_x, :location_y, :scale, :label

  def self.parse!(hash, parameters)
    hash.merge!(:location_x => parameters['Location_X'])
    hash.merge!(:location_y => parameters['Location_Y'])
    hash.merge!(:scale => parameters['Scale'])
    hash.merge!(:label => parameters['Label'])
  end
end
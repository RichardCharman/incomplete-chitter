require 'dm-timestamps'
require 'data_mapper'

class Peep
  include DataMapper::Resource

  # these property declarations set the column headers in the Link table
  property :id,     Serial # Serial means that it will be auto-incremented for every record
  property :text,      String
  property :timestamp, DateTime

end
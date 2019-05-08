class Event < ActiveRecord::Base
  belongs_to :story
  


  #validates_presence_of :event_name
end

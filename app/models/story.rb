class Story < ActiveRecord::Base
  belongs_to :writers
  has_many :characters
  has_many :events
end

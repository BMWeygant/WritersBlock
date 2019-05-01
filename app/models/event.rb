class Event < ActiveRecord::Base
  belongs_to :stories
  belongs_to :writers, through: :stories
  has_many :characters, through: :stories
end

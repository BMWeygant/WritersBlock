class Story < ActiveRecord::Base
  belongs_to :user
  has_many :characters
  has_many :events

#  validates_presence_of :title
end

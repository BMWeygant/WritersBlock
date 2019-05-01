class Character < ActiveRecord::Base
  belongs_to :stories
  belongs_to :writers, through: :stories
  has_many :events, through: :stories
end

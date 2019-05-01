class Writer < ActiveRecord::Base
has_many :stories
has_many :characters, through: :stories
has_many :events, through: :stories
end

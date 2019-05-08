class User < ActiveRecord::Base
has_many :stories
has_secure_password

  def slug
    self.username.downcase.gsub(/\s+/,'-')
  end

  def self.find_by_slug(slug)
    self.all.find { |s| s.slug == slug }
  end
  
end

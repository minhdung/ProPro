class UserGroup < ActiveRecord::Base
  has_many :users
  has_many :charts
  has_many :tools
  has_many :sections, :through => :charts
  has_many :readings, :through => :charts
  attr_accessible :name
end

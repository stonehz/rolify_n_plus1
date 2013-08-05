class Organisation < ActiveRecord::Base
  resourcify
  attr_accessible :name
  has_many :users
end

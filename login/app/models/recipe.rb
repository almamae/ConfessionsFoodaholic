class Recipe < ActiveRecord::Base
  attr_accessible :name
  validates :name, :uniqueness => { :message => "This recipe is already available"}	
end

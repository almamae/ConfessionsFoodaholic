class Recipe < ActiveRecord::Base
  attr_accessible :name
  validates :name, :uniqueness => { :message => "This recipe is already available"}	
  has_many :posts, :dependent => :destroy
  before_destroy :check_for_posts

  private

  def check_for_posts
    if posts.count > 0
      	errors.add_to_base("cannot delete customer while orders exist")
     	return false
    end
    
  end

end

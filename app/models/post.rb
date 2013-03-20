class Post < ActiveRecord::Base
  attr_accessible :category, :content, :data, :file_name, :file_type, :isApproved, :title, :user_id, :recipe_id, :uploaded_picture, :video_url, :content_type
  belongs_to :user, :foreign_key => "user_id"
  belongs_to :recipe
  CATEGORIES = ["Dish",  "Pastry", "Dessert", "Appetizer"] 
  has_many :comments, :as => :commentable, :dependent => :destroy
  validates_presence_of :content, :title, :category, :on => :create 
  validates :category, :inclusion => CATEGORIES
  make_flaggable :like

  validates_format_of :file_type,
    :with => /^image/ || /^video/,
    :message => "--- you can only upload pictures",
    :allow_blank => true

  def uploaded_picture=(file_field)
    self.file_name = base_part_of(file_field.original_filename)
    self.file_type = file_field.content_type.chomp
    self.data = file_field.read
  end

  def youtube_embed(youtube_url)
    if youtube_url[/youtu\.be\/([^\?]*)/]
      self.video_url = $1
    else
      # Regex from # http://stackoverflow.com/questions/3452546/javascript-regex-how-to-get-youtube-video-id-from-url/4811367#4811367
      youtube_url[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
      self.video_url = $5
    end

    # %Q{<iframe title="YouTube video player" width="640" height="390" src="http://www.youtube.com/embed/#{ youtube_id }" frameborder="0" allowfullscreen></iframe>}
  end
  
  def base_part_of(file_name)
    File.basename(file_name).gsub(/[^\w._-]/, '')
  end

  def self.search(search)
    if search
      where(:conditions => ["title LIKE ?  AND isApproved = ?", "%#{search}%", 1])
        # where('title LIKE ?' , "%#{search}%")
    else
      where(:isApproved => 1)
      # scoped
    end
  end


  def post
    return @post if defined?(@post)
    @post = commentable.is_a?(Post) ? commentable : commentable.post
  end

end

class Post < ActiveRecord::Base
  attr_accessible :title, :description, :comments_attributes, :image, :remote_image_url, :created_at
  attr_accessor :hotness
  validates_presence_of :title
  belongs_to :user
  has_many :comments, :dependent => :destroy
  accepts_nested_attributes_for :comments
  #default_scope order('created_at DESC')
  has_reputation :votes, source: :user, aggregated_by: :sum
  mount_uploader :image, ImageUploader
  self.per_page = 10


  def self.most_voted
  	find_with_reputation(:votes, :all, :order => :votes)
  end

  def self.find_by_hotness
    posts = Post.find(:all, :order => 'created_at DESC')
    posts.each do|post|
      post.hotness = (((post.reputation_for(:votes).to_f)-1)/((Time.now - post.created_at).to_f))
    end
    posts.sort! { |a,b| b.hotness <=> a.hotness }
    return posts
  end

end

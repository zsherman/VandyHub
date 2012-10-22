class Post < ActiveRecord::Base
  attr_accessible :title, :description, :comments_attributes, :image, :remote_image_url, :created_at
  validates_presence_of :title, :description
  belongs_to :user
  has_many :comments, :dependent => :destroy
  accepts_nested_attributes_for :comments
  #default_scope order('created_at DESC')
  has_reputation :votes, source: :user, aggregated_by: :sum
  mount_uploader :image, ImageUploader
  self.per_page = 5


  def self.most_voted
  	find_with_reputation(:votes, :all, :order => :votes)
  end

end

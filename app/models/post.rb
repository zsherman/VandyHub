class Post < ActiveRecord::Base
  attr_accessible :title, :description, :comments_attributes, :created_at
  validates_presence_of :title, :description
  belongs_to :user
  has_many :comments, :dependent => :destroy
  accepts_nested_attributes_for :comments
  #default_scope order('created_at DESC')
  has_reputation :votes, source: :user, aggregated_by: :sum
  self.per_page = 10


  def self.most_voted
  	find_with_reputation(:votes, :all, :order => :votes)
  end

end

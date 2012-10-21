class Post < ActiveRecord::Base
  attr_accessible :title, :description, :comments_attributes
  belongs_to :user
  has_many :comments, :dependent => :destroy
  accepts_nested_attributes_for :comments
  default_scope order('created_at DESC')
end

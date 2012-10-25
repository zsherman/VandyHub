class Comment < ActiveRecord::Base
  attr_accessible :content, :parent_id, :image, :remote_image_url
  belongs_to :user
  belongs_to :post
  has_ancestry
  mount_uploader :image, ImageUploader
end

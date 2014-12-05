class Post < ActiveRecord::Base
	validates :email,presence:true
	validates :title,presence:true
	validates :body,presence:true
	has_many :comments
	mount_uploader :image, ImageUploader
	mount_uploader :attachment, AttachmentUploader

end

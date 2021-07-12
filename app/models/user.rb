class User < ApplicationRecord
    mount_uploader :image_name, ImageUploader
    has_secure_password
    has_many :posts, class_name: "Post"
    has_many :comments, class_name: "Comment"
end

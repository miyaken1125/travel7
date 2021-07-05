class User < ApplicationRecord
    has_secure_password
    has_many :posts, class_name: "Post"
    has_many :comments, class_name: "Comment"
end

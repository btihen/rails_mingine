class Blogs::User < ApplicationRecord
  has_many :blogs_articles, class_name: 'Blogs::Article', foreign_key: 'blogs_user_id', dependent: :destroy
end

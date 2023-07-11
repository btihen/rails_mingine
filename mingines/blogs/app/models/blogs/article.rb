class Blogs::Article < ApplicationRecord
  belongs_to :blogs_user, class_name: 'Blogs::User'
end

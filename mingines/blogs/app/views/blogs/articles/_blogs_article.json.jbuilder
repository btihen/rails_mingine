json.extract! blogs_article, :id, :title, :body, :blogs_user_id, :created_at, :updated_at
json.url article_url(blogs_article, format: :json)

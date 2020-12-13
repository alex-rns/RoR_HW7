json.extract! post, :id, :name, :content, :image, :created_at, :updated_at, :title
json.url post_url(post, format: :json)

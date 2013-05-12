json.array!(@posts) do |post|
  json.extract! post, :title, :link, :text
  json.url post_url(post, format: :json)
end
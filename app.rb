require "bundler/setup"
Bundler.require

api_key = ENV["GOOGLE_API_KEY"]
engine_id = ENV["SEARCH_ENGINE_ID"]
query = "寿司"
url = "https://www.googleapis.com/customsearch/v1?key=#{api_key}&cx=#{engine_id}&q=query"

conn = Faraday.new(url: url)
response = conn.get
puts response.body

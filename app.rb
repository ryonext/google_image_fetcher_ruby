require "bundler/setup"
Bundler.require
require "json"
require "open-uri"

query = ARGV[0]

api_key = ENV["GOOGLE_API_KEY"]
engine_id = ENV["SEARCH_ENGINE_ID"]
url = "https://www.googleapis.com/customsearch/v1?key=#{api_key}&cx=#{engine_id}&q=#{query}"

conn = Faraday.new(url: URI.encode(url))
response = conn.get
result = JSON.parse(response.body)


image_url = result["items"].map do |item|
  if item["pagemap"] && item["pagemap"]["cse_image"]
    item["pagemap"]["cse_image"].first["src"]
  end
end.compact

dir_path = "data/#{query}"

FileUtils.mkdir_p(dir_path)

image_url.each do |url|
  filename = "#{dir_path}/#{File.basename(url)}"
  open(filename, 'wb') do |file|
    open(url) do |data|
      file.write(data.read)
    end
  end
end

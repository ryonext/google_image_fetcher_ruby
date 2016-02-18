require "json"
require "open-uri"
require "thor"
require "faraday"

module GoogleImageFetcher
  class CLI < Thor
    default_task :execute

    desc "execute", "Fetch images from Google"
    def execute(query)
      api_key = ENV["GOOGLE_API_KEY"]
      engine_id = ENV["SEARCH_ENGINE_ID"]
      url = "https://www.googleapis.com/customsearch/v1?key=#{api_key}&cx=#{engine_id}&q=#{query}&searchType=image"
      conn = Faraday.new(url: URI.encode(url))
      response = conn.get
      result = JSON.parse(response.body)

      image_url = result["items"].map {|item| item["link"] }

      dir_path = "#{query}"
      FileUtils.mkdir_p(dir_path)

      image_url.each do |url|
        filename = "#{dir_path}/#{File.basename(url)}"
        open(filename, 'wb') do |file|
          open(url) do |data|
            file.write(data.read)
          end
        end
      end
    end
  end
end

require "json"
require "open-uri"
require "thor"
require "faraday"
require_relative "./fetcher"

module GoogleImageFetcher
  class CLI < Thor
    desc "search", "Fetch images from Google"
    def search(query)
      search_url = Fetcher.search_url(query)
      conn = Faraday.new(url: URI.encode(search_url))
      response = conn.get
      result = JSON.parse(response.body)
      image_url = result["items"].map {|item| item["link"] }
      Fetcher.store(query, image_url)
    end
  end
end

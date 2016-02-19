module GoogleImageFetcher
  class Fetcher
    class << self
      def search_url(query)
        api_key = ENV["GOOGLE_API_KEY"]
        engine_id = ENV["SEARCH_ENGINE_ID"]
        url = "https://www.googleapis.com/customsearch/v1?key=#{api_key}&cx=#{engine_id}&q=#{query}&searchType=image"
      end

      def store(dir_path, image_url)
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
end

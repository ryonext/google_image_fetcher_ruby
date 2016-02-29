require "spec_helper"


describe GoogleImageFetcher::Fetcher do
  describe ".search_url" do
    subject { GoogleImageFetcher::Fetcher.search_url(query) }
    let(:query) { "sushi" }
    it "returns url with api_key and engine_id and query" do
      expect(subject).to eq "https://www.googleapis.com/customsearch/v1?key=#{ENV["GOOGLE_API_KEY"]}&cx=#{ENV["SEARCH_ENGINE_ID"]}&q=#{query}&searchType=image"
    end
  end

  describe ".store" do
    subject { GoogleImageFetcher::Fetcher.store(dir_path, image_urls) }
    let(:dir_path) { "./tmp/test/#{SecureRandom.uuid}" }
    let(:image_urls) { [Faker::Company.logo] }
    it "stores image file" do
      expect { subject }.to change { Dir.glob("#{dir_path}/*").count }.by 1
      subject
    end
  end
end

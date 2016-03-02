# GoogleImageFetcher

This gem fetches images from Google Image Search.

## Installation

```
$ gem install google_image_fetcher
```

## Usage

Before you use this gem, you have to get api key for google custom search, and enable image search.

https://cse.google.co.jp

When you get api key and search engine id, please set these environmental variables.

```
export GOOGLE_API_KEY={your-api-key}
export SEARCH_ENGINE_ID={your-custome-search-engine-id}
```

After thar, you can fetch images by this command.

```
google_image search {keyword}
```

you can get images related to keyword.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/google_image_fetcher. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


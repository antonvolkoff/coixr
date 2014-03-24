require 'anemone'

class Crawler::Walker
  attr_reader :host

  def initialize(host = "https://medium.com/")
    @host = host
  end

  def run
    Anemone.crawl(host) do |anemone|
      anemone.focus_crawl do |page| 
        page.links.keep_if { |link| allow_link?(link.to_s) }
      end

      anemone.on_every_page do |page|
        article_attributes = {}
        article_attributes[:title]       = "[placeholder]"
        article_attributes[:url]         = "[placeholder]"
        article_attributes[:description] = "[placeholder]"
        article_attributes[:author]      = "[placeholder]"

        puts "Article attributes: #{article_attributes.inspect}"
      end
    end
  end

  def allow_link?(link)
    !(link.include?("/_/") || link.include?("/m/") || 
      link.include?("/me/") || link.include?("/@me"))
  end
end
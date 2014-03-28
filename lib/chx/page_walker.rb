require 'anemone'

class Chx::PageWalker
  attr_reader :host

  def initialize(host = "https://medium.com/")
    @host = host
  end

  def walk
    site = Site.where(url: host).first
    site = Site.create(title: 'Medium', url: host) if site.nil?

    Anemone.crawl(host) do |anemone|
      anemone.focus_crawl do |page| 
        page.links.keep_if { |link| allow_link?(link.to_s) }
      end

      anemone.on_every_page { |page| inspect_page(page) }
    end
  end

  def inspect_page(page)
    return if Node.where(url: page.url.to_s).first # Page is crawled already
    
    inspector = Chx::Inspector.new(page)
    if inspector.article?
      article_attributes = {}
      article_attributes[:title]       = inspector.title
      article_attributes[:url]         = inspector.url
      article_attributes[:description] = inspector.description
      # article_attributes[:author]      = inspector.author

      Article.create!(article_attributes)
      puts "Added article"
    end
  end

  protected

  def allow_link?(link)
    !(link.include?("/_/") || link.include?("/m/") || 
      link.include?("/me/") || link.include?("/@me"))
  end
end
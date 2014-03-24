require 'anemone'

class Chx::PageWalker
  attr_reader :host

  def initialize(host = "https://medium.com/")
    @host = host
  end

  def walk
    Anemone.crawl(host) do |anemone|
      anemone.focus_crawl do |page| 
        page.links.keep_if { |link| allow_link?(link.to_s) }
      end

      anemone.on_every_page do |page|
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
    end
  end

  protected

  def allow_link?(link)
    !(link.include?("/_/") || link.include?("/m/") || 
      link.include?("/me/") || link.include?("/@me"))
  end
end
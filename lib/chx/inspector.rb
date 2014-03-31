class Chx::Inspector
  attr_reader :page, :doc

  def initialize(page)
    @page = page
    @doc  = Nokogiri::HTML(page.body)
  end

  def type
    meta_by_propery('og:type').first
  end

  def article?
    type == 'article'
  end

  def profile?
    type == 'profile'
  end

  def title
    meta_by_propery('og:title').first
  end

  def description
    meta_by_propery('og:description').first
  end

  def author
    meta_by_propery('article:author').first
  end

  def url
    page.url.to_s
  end

  def username
    meta_by_propery('profile:username').first
  end

  def first_name
    meta_by_propery('profile:first_name').first
  end

  def last_name
    meta_by_propery('profile:last_name').first
  end

  protected

  def meta_by_propery(name)
    doc.css("meta[property='#{name}']").map do |tag|
      tag.attributes['content'].value
    end
  end
end
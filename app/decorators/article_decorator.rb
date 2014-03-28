class ArticleDecorator < Draper::Decorator
  delegate :description

  def id_query
    h.link_to 'id', h.root_url(query: "articles where _id = \"#{object.id}\"")
  end

  def author_query
    h.link_to 'author', h.root_url(query: "profiles where url = \"#{object.author}\"")
  end

  def authors_articles_query
    h.link_to "author's articles", h.root_url(query: "articles where author = \"#{object.author}\"")
  end

  def link
    h.link_to object.title, object.url
  end

  def meta
    [:id_query, :author_query, :authors_articles_query]
  end

  def host
    uri = URI(object.url)
    "#{uri.scheme}://#{uri.host}"
  end
end

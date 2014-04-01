class SiteDecorator < NodeDecorator
  def queries
    [:id, :authors, :articles]
  end

  def id
    h.link_to 'id', h.root_url(query: "sites where _id = \"#{object.id}\"")
  end

  def authors
    h.link_to 'authors', h.root_url(query: "profiles where site_id = \"#{object.id}\"")
  end

  def articles
    h.link_to 'articles', h.root_url(query: "articles where site_id = \"#{object.id}\"")
  end
end
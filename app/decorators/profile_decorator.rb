class ProfileDecorator < NodeDecorator
  def queries
    [:id, :articles]
  end
  
  def id
    h.link_to 'id', h.root_url(query: "profiles where _id = \"#{object.id}\"")
  end

  def articles
    h.link_to "articles", h.root_url(query: "articles where author = \"#{object.url}\"")
  end
end

class ArticleDecorator < NodeDecorator
  def queries
    [:id, :author]
  end

  def id
    h.link_to 'id', h.root_url(query: "articles where _id = \"#{object.id}\"")
  end

  def author
    unless object.author_id.nil?
      h.link_to('author',
        h.root_url(query: "profiles where _id = \"#{object.author_id}\""))
    end
  end
end

class Article < Node
  field :author,        type: String
  field :author_url,    type: String
  field :author_id,     type: String

  field :category,      type: String
  field :published_at,  type: DateTime
end

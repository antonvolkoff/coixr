module SWQL
  def self.parse(query)
    tree = SWQL::Parser.new.parse(query)
    SWQL::Transformer.new.apply(tree)
  end
end
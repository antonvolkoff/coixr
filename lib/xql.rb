module XQL
  def self.parse(query)
    ast = XQL::Parser.new.parse(query)
    XQL::Transformer.new.apply(ast)
  end
end
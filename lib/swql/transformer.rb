class SWQL::Transformer < Parslet::Transform
  attr_reader :queries

  rule(string: simple(:s))  { String(s) }
  rule(integer: simple(:i)) { Integer(i) }
  rule(float: simple(:f))   { Float(f) }
  rule(boolean: simple(:b)) { b == "true" }

  rule(predicate: simple(:predicate), object: subtree(:object)) do
    { predicate.to_sym => object }
  end

  rule(subject: simple(:subject), messages: subtree(:messages)) do
    tree = {:subject => subject}
    messages.each { |message| tree.merge!(message) }
    tree
  end

  rule(triplet: subtree(:triplet)) do
    type = triplet.delete(:subject)
    attributes = { _type: String(type).classify }.merge(triplet)

    # @queries = [] unless @queries
    # @queries << attributes
    Node.where(attributes)
    
    # "__:#{@queries.size}:__"
  end
end
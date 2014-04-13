class SWQL::Transformer < Parslet::Transform
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

  rule(sub: subtree(:sub)) do
    type = sub.delete(:subject)
    attributes = { _type: String(type).classify }.merge(sub)
    
    Node.where(attributes).to_a.map { |node| node.id }
  end

  rule(root: subtree(:root)) do
    type = root.delete(:subject)
    attributes = { _type: String(type).classify }.merge(root)
  end
end
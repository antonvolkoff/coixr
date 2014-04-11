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
end
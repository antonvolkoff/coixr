class XQL::Transformer < Parslet::Transform
  rule(string: simple(:s))  { String(s) }
  rule(integer: simple(:i)) { Integer(i) }
  rule(float: simple(:f))   { Float(f) }
  rule(boolean: simple(:b)) { b == "true" }

  rule(key: simple(:key), value: subtree(:value)) do
    {key.to_sym => value}
  end

  rule(type: simple(:t)) do
    { _type: String(t).classify }
  end

  rule(type: simple(:type), condition: subtree(:condition)) do
    { _type: String(type).classify }.merge(condition)
  end
end
class XQL::Parser < Parslet::Parser
  rule(:space)      { match('\s').repeat(1) }
  rule(:space?)     { space.maybe }
  rule(:category)   { str("articles").as(:category) }
  rule(:where)      { str("where") }
  rule(:condition)  { (str("author = \"John\"") >> space?) }

  rule(:query) { category >> (space >> where >> space >> (condition).repeat.as(:conditions)).maybe }
  root :query
end
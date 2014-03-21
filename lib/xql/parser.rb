class XQL::Parser < Parslet::Parser
  # rule(:space)      { match('\s').repeat(1) }
  # rule(:space?)     { space.maybe }
  # rule(:category)   { str("articles").as(:category) }
  # rule(:where)      { str("where") }
  # rule(:condition)  { (str("author = \"John\"") >> space?) }

  # rule(:query) { category >> (space >> where >> space >> (condition).repeat.as(:conditions)).maybe }
  # root :query

  rule(:space)      { match["\t "] }
  rule(:whitespace) { space.repeat }

  rule(:digit) { match('[0-9]') }

  rule(:integer)  { str('-').maybe >> match("[1-9]") >> digit.repeat }
  rule(:float)    { str('-').maybe >> digit.repeat(1) >> str('.') >> digit.repeat(1) }
  rule(:boolean)  { str('true') | str('false') }
  rule(:string)   { str('"') >> (str('"').absent? >> any).repeat >> str('"') }
  
  rule(:value) do 
    integer | float | boolean | string
  end

  rule(:key) do 
    (match["\\[\\]=."].absent? >> space.absent? >> any).repeat(1)
  end

  rule(:condition) do
    whitespace >> key >> whitespace >> str('=') >> whitespace >> value  
  end

  rule(:query) do
    whitespace >> key >> (whitespace >> str('where') >> condition).maybe
  end

  root :query
end
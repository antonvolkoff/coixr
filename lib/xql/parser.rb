class XQL::Parser < Parslet::Parser
  rule(:space)      { match["\t "] }
  rule(:whitespace) { space.repeat }

  rule(:digit) { match('[0-9]') }

  rule(:integer)  do
    (str('-').maybe >> match("[1-9]") >> digit.repeat).as(:integer)
  end

  rule(:float) do 
    (str('-').maybe >> digit.repeat(1) >> str('.') >> 
     digit.repeat(1)).as(:float)
  end
  rule(:boolean) do 
    (str('true') | str('false')).as(:boolean)
  end

  rule(:string) do 
    str('"') >> 
    ((str('"').absent? >> any).repeat).as(:string) >> 
    str('"')
  end
  
  rule(:value) do 
    integer | float | boolean | string
  end

  rule(:key) do 
    (match["\\[\\]=."].absent? >> space.absent? >> any).repeat(1)
  end

  rule(:condition) do
    whitespace >> 
    key.as(:key) >> 
    whitespace >> 
    str('=') >> 
    whitespace >> 
    value.as(:value)  
  end

  rule(:query) do
    whitespace >> 
    key.as(:type) >> 
    (
      whitespace >> 
      str('where') >> 
      condition.as(:condition)
    ).maybe
  end

  root :query
end
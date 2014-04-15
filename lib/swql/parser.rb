class SWQL::Parser < Parslet::Parser
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
    (match["\\[\\]=:."].absent? >> space.absent? >> any).repeat(1)
  end

  rule(:message) do
    whitespace >> key.as(:predicate) >> str(':') >> whitespace >> 
    (value | triplet.as(:sub)).as(:object)
  end

  rule(:triplet) do
    (
      whitespace >> str('(').maybe >> whitespace >> 
      key.as(:subject) >> whitespace >> (message).repeat.as(:messages).maybe >>
      whitespace >> str(')').maybe >> whitespace
    )
  end

  rule(:query) { triplet.as(:root) }

  root :query
end
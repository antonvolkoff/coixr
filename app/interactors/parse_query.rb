class ParseQuery
  include Interactor

  def perform
    begin
      conditions = xql_module.parse(context[:query])
      context[:conditions] = conditions
    rescue Exception => e
      context[:message] = 'Sorry, query is wrong'
      fail!
    end
  end

  protected

  def xql_module
    context[:xql_module] || XQL
  end
end

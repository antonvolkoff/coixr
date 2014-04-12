class SearchWithConditions
  include Interactor

  def perform
    nodes = conditions.desc(:created_at).page(page_num)

    context[:nodes] = NodesDecorator.decorate(nodes)
    if nodes.empty?
      context[:message] = "Sorry, nothing is found"
      fail!
    end
  end

  protected

  def conditions
    context[:conditions]
  end

  def node_class
    context[:node_class] || Node
  end

  def page_num
    context[:params][:page] || 1
  end
end

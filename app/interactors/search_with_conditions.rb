class SearchWithConditions
  include Interactor

  def perform
    nodes = node_class.where(conditions).to_a

    context[:nodes] = Draper::CollectionDecorator.decorate(nodes)
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
end

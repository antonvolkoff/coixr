class NodesDecorator < Draper::CollectionDecorator
  delegate :last_page?, :current_page
end
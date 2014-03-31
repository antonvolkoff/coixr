class NodeDecorator < Draper::Decorator
  delegate :description

  def link
    h.link_to object.title, object.url
  end

  def host
    URI(object.url).host
  end
end
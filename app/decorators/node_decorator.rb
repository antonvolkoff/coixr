class NodeDecorator < Draper::Decorator
  delegate :description

  def link
    h.link_to object.title, object.url
  end

  def host
    uri = URI(object.url)
    "#{uri.scheme}://#{uri.host}"
  end
end
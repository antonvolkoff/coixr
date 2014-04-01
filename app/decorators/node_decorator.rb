class NodeDecorator < Draper::Decorator
  delegate :description

  def link
    h.link_to object.title, object.url, target: '_blank'
  end

  def host
    URI(object.url).host
  end

  def site
    h.link_to 'site', h.root_url(query: "sites where _id = \"#{object.site_id}\"")
  end
end
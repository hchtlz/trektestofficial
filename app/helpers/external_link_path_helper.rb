module ExternalLinkPathHelper
  def external_link_url(object)
    raise "#{object} is not an external link" unless object.is_a?(ExternalLink)

    object.url
  end
  alias_method :external_link_path, :external_link_url
end

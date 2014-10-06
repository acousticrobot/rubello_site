class Section
  attr_accessor :html, :content

  def initialize(content, options={})
    @content = scrubbed_content(content)

    @html = options.fetch(:html, "p")
    @css_class = options.fetch(:css_class, nil)
  end

  def scrubbed_content(content)
    # find links: %link[Sea of Tranquility, sea_of_tranquility]
    content.strip.gsub(/%link\s*\[([^%]*)\s*,\s*([^%\s]*)\s*\]/,'<a href="\2.html">\1</a>')
  end

  def css_class
    @css_class ? " class=\" #{@css_class}\"" : ""
  end

  def to_s
    case html
    when "img"
      "<img#{css_class} src=\"img/#{content}\" alt=\"#{content.match(/(.*)\./)[1]}\">"
    when "a"
      # link to page
    else
      "<#{html}#{css_class}>#{content}</#{html}>\n"
    end
  end
end

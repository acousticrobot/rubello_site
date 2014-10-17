class Section
  attr_accessor :html, :content

  def initialize(content, options={})
    @content = scrubbed_content(content)

    @html = options.fetch(:html, "p")
    @css_class = options.fetch(:css_class, nil)
  end

  def scrubbed_content(content)
    # find links: %link[sea_of_tranquility,Sea of Tranquility]
    scrubbed = content.strip.gsub(/%link\s*\[([^%]*),([^%]*)\s*\]/,'<a href="\1.html">\2</a>')

    # find bold: **See also ....**
    scrubbed = scrubbed.strip.gsub(/\*\*([^\*]*)\*\*/,'<strong>\1</strong>')

    # find italic: *The Title of a Painting*
    scrubbed = scrubbed.strip.gsub(/\*([^\*]*)\*/,'<cite>\1</cite>')
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

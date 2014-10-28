class Section
  attr_accessor :html, :content

  def initialize(content, options={})
    @content = scrubbed_content(content)

    @html = options.fetch(:html, "p")
    @css_class = options.fetch(:css_class, nil)
  end

  def scrubbed_content(content)
    # find links: %link[sea_of_tranquility,Sea of Tranquility]
    scrubbed = content.strip.gsub(/@link\s*\[[^@]*,[^@]*\s*\]/) do |raw_link|
      link_attr = raw_link.match(/@link\s*\[([^@]*),([^@]*)\s*\]/)
      if link_attr[1].match /http:\/\//
        link = link_attr[1]
      else
        link = link_attr[1] + ".html"
      end
      "<a href=\"#{link}\">#{link_attr[2]} </a>\n"
    end

    #find references links
    scrubbed = scrubbed.strip.gsub(/#(\d+)/,'<a href="references.html"><sup>\1 </sup></a>')

    # find bold: **See also ....** old regex: /\*\*([^\*]*)\*\*/
    scrubbed = scrubbed.strip.gsub(/\*\*(.*\*(?!=\*).*)\*\*/,'<strong>\1</strong>')


    # find italic: *The Title of a Painting*
    scrubbed = scrubbed.strip.gsub(/\*([^\*]*)\*/,'<cite>\1</cite>')

    # create blockquoted sections
    scrubbed = scrubbed.strip.gsub(/\^([^\^]*)\^/,'<blockquote>\1</blockquote>')
  end

  def css_class
    @css_class ? " class=\" #{@css_class}\"" : ""
  end

  def to_s
    case html
    when "img"
        "<img#{css_class} src=\"img/#{content}.jpg\" alt=\"#{content}\">"
    when "a"
      # link to page
    else
      "<#{html}#{css_class}>#{content}</#{html}>\n"
    end
  end
end

class Article
  attr_accessor :slug, :color, :next_slug
  attr_reader :content

  def initialize(slug)
    @slug = slug.strip
    @title = slug
    @content = []
    @color = %w"red pink blood-orange sherbert lemon lt-green dk-green teal lt-blue violet mauve".sample
  end

  def add_content(section)
    @content << section
  end

  def title=(title)
    @title = title.strip
  end

  def title
    @title
  end

  def next_slug=(next_slug)
    @next_slug = next_slug.strip
  end

  def save(writer)
    writer.write_to_file("#{slug}.html", to_s)
  end

  def to_s
    "#{header}\n#{body}\n#{footer}"
  end

  def header
    "<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<meta name=\"description\" content=\"David Rubello\" />\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\n<meta name=\"viewport\" content=\"width=device-width, initial-scale=1 user-scalable=0\" />\n<title>#{@title}</title>\n<link rel=\"stylesheet\" href=\"css/main.css\" />\n<link rel=\"stylesheet\" href=\"css/colors.css\" />\n</head>"
  end

  def contents
    content.inject(""){|mem,c| mem += c.to_s}
  end

  def links
    "<nav><ul><li><a class=\"eight-mile\" href=\"http://www.infinitemiledetroit.com/index.html\"></a></li><li><a class=\"grid\" href=\"index.html\"></a></li></ul></nav>\n"
  end

  def body
    "<body class=\"#{color}\">\n#{links}<section class=\"article\">\n#{contents}\n</section>"
  end

  # Legacy, we no longer actually use the title, supplied in the H2
  def body_with_title
    "<body class=\"#{color}\">\n#{links}<section class=\"article\">\n<h1>#{title}</h1>\n#{contents}</section>\n"
  end

  def footer
    "<section class=\"next-link\"><a class=\"next-page\" href=\"#{next_slug}.html\">next</a>\n</body>\n</html>"
  end
end

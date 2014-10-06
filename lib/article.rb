class Article
  attr_accessor :slug, :color
  attr_reader :content

  def initialize(slug)
    @slug = slug.strip
    @title = slug
    @content = []
    @color = %w"red pink peach blood-orange sherbert lemon lt-green dk-green teal lt-blue violet mauve black".sample
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

  def save(writer)
    writer.write_to_file("#{slug}.html", to_s)
  end

  def to_s
    "#{header}\n#{body}\n#{footer}"
  end

  def header
    "<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<meta name=\"description\" content=\"David Rubello\" />\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\n<meta name=\"viewport\" content=\"width=device-width, initial-scale=1 user-scalable=0\" />\n<title>#{@title}</title>\n<link rel=\"stylesheet\" href=\"css/main.css\" />\n</head>"
  end

  def contents
    content.inject(""){|mem,c| mem += c.to_s}
  end

  def body
    "<body class=\"#{color}\">\n<div class=\"article\">\n<h1>#{title}</h1>\n#{contents}</div>\n</body>"
  end

  def footer
    "</html>"
  end
end

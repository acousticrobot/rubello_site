class Index
  attr_reader :articles

  def initialize()
    @articles = []
  end

  def add_article(article)
    @articles << article
  end

  def save(writer)
    writer.write_to_file("index.html", self.to_s)
  end

  def to_s
    "#{header}\n#{body}\n#{footer}"
  end

  def header
    "<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<meta name=\"description\" content=\"David Rubello\" />\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\n<meta name=\"viewport\" content=\"width=device-width, initial-scale=1 user-scalable=0\" />\n<title>David Rubello</title>\n<link rel=\"stylesheet\" href=\"css/grid.css\" />\n<link rel=\"stylesheet\" href=\"css/colors.css\" />\n</head>"
  end

  def contents
    articles.inject("") { |mem,a| mem += "<a href=\"#{a.slug}.html\" class=\"#{a.color}\">\n<h2>#{a.title}</h2>\n</a>" }
  end

  def body
    "<body>\n#{contents}</body>"
  end

  def footer
    "</html>"
  end
end

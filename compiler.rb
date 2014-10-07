#!/usr/bin/env ruby

require './lib/section.rb'
require './lib/index.rb'
require './lib/article.rb'
require './lib/reader_writer.rb'

TAG = /^%([\w]+)/
CONTENT = /^%[^\s]+(.*)/

  # article = Article.new("test_the_system")

  # article.title = "Test the System"
  # article.add_content Section.new("a paragraph")
  # article.add_content Section.new("and a second paragraph")
  # article.add_content Section.new("and a third paragraph")
  # article.color = "blue"


  # puts article.to_s

rw = ReaderWriter.new

contents = rw.read_to_array("contents.txt")

@index = Index.new()
@current_article = nil

contents.each do |line|
  next if line == "\n"
  if line.match(TAG)
    case line.match(TAG)[1]
    when "slug"
      @current_article = Article.new(line.match(CONTENT)[1])
      @index.add_article @current_article
    when "title"
      @current_article.title = line.match(CONTENT)[1]
    when "img"
      #TODO handle proper image tags
      @current_article.add_content Section.new(line.match(CONTENT)[1], html: "img")
    when "caption"
      @current_article.add_content Section.new(line.match(CONTENT)[1], html: "div", css_class: "image-caption")
    end
  else
    @current_article.add_content Section.new(line, html: "p")
  end
end

@index.save(rw)
@index.articles.each do |page|
  page.save(rw)
end

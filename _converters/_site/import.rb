#! /usr/bin/env ruby
require 'rubygems'
require 'hpricot'
require 'fileutils'
require 'date'

# This importer takes a wordpress.xml file,
# which can be exported from your 
# wordpress.com blog (/wp-admin/export.php)

filename = "wordpress.xml"
FileUtils.mkdir_p "_posts"
posts = 0

doc = Hpricot::XML(File.read(filename))

(doc/:channel/:item).each do |item|
      title = item.at(:title).inner_text.gsub(/:/, ' -')
      name = "#{Date.parse(item.at("wp:post_date").inner_text).strftime("%Y-%m-%d")}-#{title.downcase.gsub(/[^a-z0-9]/, '-').gsub(/[-]+/, '-').gsub(/[-]+\./, '')}.html"

    File.open("_posts/#{name}", "w") do |f|
      f.puts <<-HEADER
---
layout: default
title: #{title}
summary: #{title}
      HEADER
      categories = item.search("category")
      numCategories = categories.count()
      if numCategories > 0
        f.puts <<-CAT
categories:
      CAT
      end
      categories.collect{|x| x.inner_text}.uniq.each do |category|
        f.puts <<-CATEGORY
- #{category}
        CATEGORY
      end
      f.puts "---"
      f.puts item.at('content:encoded').inner_text
    end

    posts += 1
end

"Imported #{posts} posts"





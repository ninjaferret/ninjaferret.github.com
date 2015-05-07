dirListing = Dir.entries("../_posts")
dirListing.each { |x| puts x }
dirListing.each do | filename |
  if filename == "." || filename == ".."
    next
  end
#  if /^2011-02-1/.match(filename)
#    puts "Ignoring #{filename}"
#    next
#  end
  puts "Processing ../_posts/#{filename}"
#  contents = File.read("../_posts/#{filename}").gsub(/h3/, 'h4').gsub(/h2/, 'h3').gsub(/h1/, 'h2')
  contents = File.read("../_posts/#{filename}").gsub(/- Reflection/, '- .NET/Reflection')
  File.open("../_posts/#{filename}", "w") { |f| f.write(contents)}
end
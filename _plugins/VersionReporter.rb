module Jekyll
#  class Site
#    alias original_site_payload site_payload 
#    def site_payload
#      h = original_site_payload
#      payload = h["site"]
#      payload["ordered_categories"] = ordered_categories(payload["categories"])
#      h["site"] = payload
#      h
#    end
#    
#    def ordered_categories (categories)
#      ordered = categories.sort { |a, b| b[1].length <=> a[1].length }
#    end
#  end
  
  class VersionReporter < Generator
    safe true
    priority :low#

    def generate(site)
      fileName = File.join(site.dest, 'version.html')

      File.open('version.html', 'w') do |f|
        f.write(generate_report(site))
      end
      site.static_files << Jekyll::StaticFile.new(site, site.dest, '/', 'version.html')
    end

   private

    def generate_report(site)
      "Site generated with Jekyll version: #{Jekyll::VERSION}"
    end

  end
end

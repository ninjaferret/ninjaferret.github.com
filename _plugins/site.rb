module Jekyll
  class Site
    alias original_site_payload site_payload 
    def site_payload
      h = original_site_payload
      payload = h["site"]
      payload["ordered_categories"] = ordered_categories(payload["categories"])
      h["site"] = payload
      h
    end
    
    def ordered_categories (categories)
      ordered = categories.sort { |a, b| b[1].length <=> a[1].length }
    end
  end
  
end
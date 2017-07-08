module ShortsHelper
    
    def link_url(url)
        link_to url, url, :target => "_blank" 
    end
    
    def short(id)
        Short.find(id)
    end
    
end

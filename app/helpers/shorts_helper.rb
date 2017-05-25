module ShortsHelper
    
    def link_url(url)
        link_to url, url, id:'id-of-link', :target => "_blank" 
    end
end

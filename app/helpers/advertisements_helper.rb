module AdvertisementsHelper
    
    def advert(id)
        Advertisement.find(id)
    end
    
end

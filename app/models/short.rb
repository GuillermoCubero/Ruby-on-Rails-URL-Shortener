class Short < ApplicationRecord
    VALID_URL_REGEX = /\A((http|https|ftp|ftps):\/\/)?(([a-z0-9]+\:)?[a-z0-9]+\@)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?\z/
    validates :url, presence: true, format: { with: VALID_URL_REGEX }

    def short_url
        self.id.to_s(36)
    end
    
end

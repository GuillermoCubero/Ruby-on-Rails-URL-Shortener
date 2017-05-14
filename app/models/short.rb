class Short < ApplicationRecord
    VALID_URL_REGEX = /https?:\/\/[\S]+\.[\S]+/
    validates :url, presence: true, format: { with: VALID_URL_REGEX }
    
    def short_url
        self.id.to_s(36)
    end
end

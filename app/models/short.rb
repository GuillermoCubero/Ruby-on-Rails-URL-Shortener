class Short < ApplicationRecord
    VALID_URL_REGEX = /https?:\/\/[\S]+\.[\S]+/
    validates :user_url, presence: true, format: { with: VALID_URL_REGEX }
end

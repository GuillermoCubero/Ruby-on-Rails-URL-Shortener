class Advertisement < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 80 }
  validates :picture, presence: true
  validate  :picture_size, on: :create
  mount_uploader :picture, PictureUploader
  
  def self.search(term)
    if term
      where('title LIKE ?', "%#{term}%").order('id DESC')
    else
      order('id DESC') 
    end
  end
  
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB.")
    end
  end

end

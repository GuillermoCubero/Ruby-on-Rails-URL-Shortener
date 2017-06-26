class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :advertisements, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  def self.search(term)
    if term
      where('email LIKE ?', "%#{term}%").order('id DESC')
    else
      order('id DESC') 
    end
  end

end
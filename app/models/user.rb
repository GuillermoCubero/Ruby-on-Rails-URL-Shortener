class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
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
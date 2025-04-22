class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :posts, dependent: :destroy
  
  validates :nickname, presence: true, uniqueness: true
  
  def update_last_login
    self.update_column(:last_login_at, Time.current)
  end
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :teams, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_teams, through: :likes, source: :team, dependent: :destroy
  has_many :players, dependent: :destroy

  def already_liked?(team)
    self.likes.exists?(team_id: team.id)
  end

end

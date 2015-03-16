class Dream < ActiveRecord::Base
  has_many :dream_dreamsigns, dependent: :destroy
  has_many :dreamsigns, through: :dream_dreamsigns

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
end

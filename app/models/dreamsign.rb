class Dreamsign < ActiveRecord::Base
  has_many :dream_dreamsigns, dependent: :destroy
  has_many :dreams, through: :dream_dreamsigns
end

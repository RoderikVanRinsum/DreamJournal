class Dream < ActiveRecord::Base
  has_many :dream_dreamsigns, dependent: :destroy
  has_many :dreamsigns, through: :dream_dreamsigns

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true

  scope :search, ->(keyword) { where('keywords LIKE ?', "%#{keyword.downcase}%") if keyword.present? }
  scope :lucid?, ->(is_lucid) { where( lucid: true ) if is_lucid == 'true' }
  scope :between, ->(from, to) { where('date between ? and ?', from, to) if from && to }

  before_save :set_keywords

  protected

    def set_keywords
      self.keywords = [name, description].map(&:downcase).join(' ')
    end
end

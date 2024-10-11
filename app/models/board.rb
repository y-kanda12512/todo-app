class Board < ApplicationRecord
    belongs_to :user
    has_many :task
  
    validates :name, presence: true
    validates :name, length: { minimum: 2, maximum: 100 }
  
    validates :description, presence: true
    validates :description, length: { minimum: 5 }
    validates :description, uniqueness: true
  end
  
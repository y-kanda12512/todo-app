class Task < ApplicationRecord
    has_one_attached :eyecatch
    belongs_to :board
    belongs_to :user
    has_many :comments,dependent: :destroy

    validates :title, presence: true
    validates :content, presence: true
end

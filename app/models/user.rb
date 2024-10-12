class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :boards,dependent: :destroy
  has_many :tasks,dependent: :destroy
  has_many :comments,dependent: :destroy
  has_one :profile,dependent: :destroy

  def has_written_board?(board)
    boards.exists?(id: board.id)
  end

  def has_written_task?(task)
    tasks.exists?(id: task.id)
  end

  def prepare_profile
    profile || build_profile
  end

  # アバターが登録されていたら表示する、登録されていなければデフォルト画像を表示する
  def avatar_image
    if profile&.avatar&.attached?
      profile.avatar
    else
      'default-avatar.png'
    end
  end
end

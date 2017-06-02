class Turtlegram < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :likes

  # has_many :comments,
  # -> { extending WithUserAssociationExtension },
  # dependent: :destroy

  def create_comment(comment_params, user)
    comment = user.comments.new(comment_params)
    comment.update(turtlegram_id: self.id)
    comment.save
  end

  def new_like(user)
    like = user.likes.new
    like.update(turtlegram_id: self.id)
    like.save
  end
  
end

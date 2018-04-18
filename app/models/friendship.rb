class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'
  # state must be present, have valid value
  validates :state, presence: true, inclusion: { in: ['pending', 'requested', 'accepted'] }
  # friend must be unique in scope of user
  validates :friend, uniqueness: { scope: :user }
  # custom validation - user_id can't equal friend_id
  validate :friend_self

  private

  def friend_self
    user.eql?(friend) ? errors.add(:user, 'cannot friend itself') : nil
  end
end

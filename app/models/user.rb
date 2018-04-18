class User < ApplicationRecord
  # include Bcrypt gem for password encryption
  include BCrypt

  has_many :playlists, dependent: :destroy
  has_many :friendships, dependent: :destroy
  has_many :friends,
           -> { where(friendships: { state: 'accepted' }) },
           through: :friendships
  has_many :requested_friends,
           -> { where(friendships: { state: 'requested' }) },
           through: :friendships, source: :friend
  has_many :pending_friends,
           -> { where(friendships: { state: 'pending' }) },
           through: :friendships, source: :friend
  # first_name must be present
  validates :first_name, presence: true
  # last_name must be present
  validates :last_name, presence: true
  # email must be present and unique
  validates :email, presence: true, uniqueness: true
  # custom validation - first name not nil, is capitalized
  validate :first_name_valid
  # custom validation - last name not nil, is capitalized
  validate :last_name_valid
  # custom validation - email not nil, must have @ or '.'
  validate :email_valid

  def full_name
    first_name + ' ' + last_name
  end

  def send_friend_request(friend)
    return if Friendship.exists?(user: self, friend: friend) &&
              Friendship.exists?(user: friend, friend: self)
    Friendship.create(user: self, friend: friend, state: 'requested')
    Friendship.create(user: friend, friend: self, state: 'pending')
  end

  def accept_friend_request(friend)
    return unless Friendship.exists?(user: self, friend: friend) &&
                  Friendship.exists?(user: friend, friend: self)
    @frienship1 = Friendship.where(user_id: id, friend_id: friend.id)
    @friendship2 = Friendship.where(user_id: friend.id, friend_id: id)
    @frienship1.update(state: 'accepted')
    @friendship2.update(state: 'accepted')
  end

  def delete_friend(friend)
    return unless Friendship.exists?(user: self, friend: friend) ||
                  Friendship.exists?(user: friend, friend: self)
    Friendship.where(user_id: id, friend_id: friend.id).destroy_all
    Friendship.where(user_id: friend.id, friend_id: id).destroy_all
  end

  def password
    password_hash.nil? ? nil : @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  private

  def first_name_valid
    return unless first_name.nil? || !first_name.capitalize.eql?(first_name)
    errors.add(:first_name, 'must be capitalized')
  end

  def last_name_valid
    return unless last_name.nil? || !last_name.capitalize.eql?(last_name)
    errors.add(:last_name, 'must be capitalized')
  end

  def email_valid
    return unless email.nil? || !email.include?('@') || !email.include?('.')
    errors.add(:email, "must have an '@' and a '.'")
  end
end

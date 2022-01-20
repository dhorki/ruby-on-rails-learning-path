# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  scope :alpha_sorted, -> { order('username ASC') }

  EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

  validates :username, presence: true,
                       length: { within: 8..25 },
                       uniqueness: true

  validates :password, presence: true,
                       length: { within: 8..25 },
                       confirmation: true

  validates :password_confirmation, presence: true

  validates :first_name, presence: true,
                         length: { maximum: 25 }

  validates :last_name, presence: true,
                        length: { maximum: 50 }

  validates :email, presence: true,
                    length: { maximum: 100 },
                    format: EMAIL_REGEX
end

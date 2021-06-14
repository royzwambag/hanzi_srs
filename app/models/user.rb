class User < ApplicationRecord
  # TODO: See if Devise is an option
  has_many :reviews
end

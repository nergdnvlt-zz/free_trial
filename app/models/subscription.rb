class Subscription < ApplicationRecord
  belongs_to :user
  has_many :charges
end

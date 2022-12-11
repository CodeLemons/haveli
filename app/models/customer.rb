class Customer < ApplicationRecord
  belongs_to :user
  has_many :orders, dependent: :destroy
  validates :name, presence: true
  validates :email, presence: true
  validates :phone, presence: true
end

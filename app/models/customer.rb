class Customer < ApplicationRecord
  belongs_to :user
  has_many :orders, dependent: :destroy
  has_many :reservations, dependent: :destroy
  validates :name, presence: true
  validates :email, presence: true, format: { with: /\A[\w+-.]+@[a-z\d-]+(.[a-z\d-]+)*.[a-z]+\z/i }
  validates :phone, presence: true
  validates :address, presence: true
end

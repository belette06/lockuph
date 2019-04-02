class Proprietor < ApplicationRecord
  belongs_to :user,dependent: :destroy


 end

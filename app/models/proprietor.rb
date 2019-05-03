# frozen_string_literal: true

class Proprietor < ApplicationRecord
  belongs_to :user

  has_many :homes
  accepts_nested_attributes_for :homes
end

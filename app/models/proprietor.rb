# frozen_string_literal: true

class Proprietor < ApplicationRecord
  belongs_to :user, class_name: 'User'

  has_many :homes
  accepts_nested_attributes_for :homes
end

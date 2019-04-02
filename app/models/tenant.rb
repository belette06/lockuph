class Tenant < ApplicationRecord

  belongs_to :user, dependent: :destroy

end

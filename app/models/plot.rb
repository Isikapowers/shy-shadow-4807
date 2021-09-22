class Plot < ApplicationRecord
  belongs_to :garden
  has_many :patches
  has_many :plants, through: :patches
end

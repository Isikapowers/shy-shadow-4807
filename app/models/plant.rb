class Plant < ApplicationRecord
  has_many :patches
  has_many :plots, through: :patches
end

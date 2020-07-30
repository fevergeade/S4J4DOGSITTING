class Dogsitter < ApplicationRecord
  belongs_to :city
  has_many :strolls
  has_many :join_table_stroll_dogs, through: :strolls
  has_many :dogs, through: :strolls
end

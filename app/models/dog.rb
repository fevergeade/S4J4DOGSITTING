class Dog < ApplicationRecord
  has_many :join_table_stroll_dogs
  has_many :strolls, through: :join_table_stroll_dogs
  has_many :dogsitters, through: :strolls
  belongs_to :city
end

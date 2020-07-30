class CreateJoinTableStrollDogs < ActiveRecord::Migration[5.2]
  def change
    create_table :join_table_stroll_dogs do |t|
      t.belongs_to :stroll, index: true
      t.belongs_to :dog, index: true
      t.timestamps
    end
  end
end

class CreateTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :teams do |t|
      t.string :teamname
      t.string :image
      t.text :explanation
      t.string :country

      t.timestamps
    end
  end
end

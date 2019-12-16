class CreatePledges < ActiveRecord::Migration[6.0]
  def change
    create_table :pledges do |t|
      t.string :action
      t.text :description

      t.timestamps
    end
  end
end

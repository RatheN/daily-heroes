class CreateCommitments < ActiveRecord::Migration[6.0]
  def change
    create_table :commitments do |t|
      t.integer :user_id
      t.integer :pledge_id
      t.string :frequency

      t.timestamps
    end
  end
end

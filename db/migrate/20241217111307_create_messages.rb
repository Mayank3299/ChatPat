class CreateMessages < ActiveRecord::Migration[7.2]
  def change
    create_table :messages do |t|
      t.string :content
      t.integer :sender_id
      t.integer :receiver_id

      t.timestamps
    end
  end
end
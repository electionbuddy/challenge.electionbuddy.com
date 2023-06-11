class CreateVersions < ActiveRecord::Migration[6.1]
  def change
    create_table :versions do |t|
      t.references :item, polymorphic: true, null: false
      t.string :event, null: false
      t.integer :whodunnit
      t.json :object
      t.timestamps
    end

    add_index :versions, [:item_type, :item_id]
  end
end

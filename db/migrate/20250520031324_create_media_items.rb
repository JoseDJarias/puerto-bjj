class CreateMediaItems < ActiveRecord::Migration[8.0]
  def change
    create_table :media_items do |t|
      t.string :title
      t.text :description
      t.string :category

      t.timestamps
    end
  end
end

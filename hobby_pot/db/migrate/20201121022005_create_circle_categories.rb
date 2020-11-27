class CreateCircleCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :circle_categories do |t|
      t.integer :circle_id
      t.integer :category_id
      
      t.timestamps
    end
    add_index :circle_categories, :circle_id
    add_index :circle_categories, :category_id
    add_index :circle_categories, [:circle_id, :category_id], unique:true
  end
end

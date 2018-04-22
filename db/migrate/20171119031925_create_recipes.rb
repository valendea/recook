class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|
    	t.references :user, foreign_key: true
    	t.string :title, null: false
    	t.string :description, null: false
    	t.string :ingredients, null: false
    	t.string :steps
    	t.json :photos
      t.timestamps
    end
  end
end

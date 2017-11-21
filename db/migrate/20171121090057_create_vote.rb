class CreateVote < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|

    	t.references :user, foreign_key: true
    	t.references :recipe, foreign_key: true

    end
  end
end

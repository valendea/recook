class AddColumnToVote < ActiveRecord::Migration[5.1]
  def change
		add_column :votes, :value, :integer
  end
end

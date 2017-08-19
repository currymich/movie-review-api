class AddColumnToReview < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :imdbID, :string
  end
end

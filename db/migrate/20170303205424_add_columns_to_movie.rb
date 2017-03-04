class AddColumnsToMovie < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :Genre, :string
    add_column :movies, :Rated, :string
    add_column :movies, :Metascore, :string
    add_column :movies, :imdbRating, :string
    add_column :movies, :imdbID, :string
    add_column :movies, :Plot, :string
    add_column :movies, :Year, :string
  end
end

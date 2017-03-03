class UpdateColumnsMovies < ActiveRecord::Migration[5.0]
  def change
    rename_column :movies, :title, :Title
    rename_column :movies, :poster, :Poster
  end
end

class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :genre
      t.string :director
      t.integer :prod_year
      t.integer :rating
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

class AddCategoryToPhrases < ActiveRecord::Migration
  def change
    add_column :phrases, :category, :string
  end
end

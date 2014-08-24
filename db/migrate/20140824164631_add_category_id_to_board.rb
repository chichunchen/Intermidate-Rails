class AddCategoryIdToBoard < ActiveRecord::Migration
  def change
  	add_column :boards, :category_id, :integer
  end
end

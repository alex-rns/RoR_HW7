class AddViewsCounterToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :post_views, :integer
  end
end

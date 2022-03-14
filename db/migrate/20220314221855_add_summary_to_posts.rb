class AddSummaryToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :summary, :string
  end
end

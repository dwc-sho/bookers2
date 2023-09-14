class RenameCoCokumnToBookComments < ActiveRecord::Migration[6.1]
  def change
    rename_column :book_comments, :co, :comment
  end
end

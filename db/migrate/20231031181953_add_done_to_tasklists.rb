class AddDoneToTasklists < ActiveRecord::Migration[7.1]
  def change
    add_column :tasklists, :done, :boolean
  end
end

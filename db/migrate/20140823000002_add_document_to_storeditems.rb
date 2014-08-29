class AddDocumentToStoreditems < ActiveRecord::Migration
  def change
    add_column :storeditems, :document, :string
  end
end

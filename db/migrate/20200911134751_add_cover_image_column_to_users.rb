class AddCoverImageColumnToUsers < ActiveRecord::Migration[6.0]
  def change
  	add_attachment :users, :cover_image
  end
end

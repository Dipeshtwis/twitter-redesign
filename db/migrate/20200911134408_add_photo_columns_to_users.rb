class AddPhotoColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
  	add_attachment :users, :photo
  end
end

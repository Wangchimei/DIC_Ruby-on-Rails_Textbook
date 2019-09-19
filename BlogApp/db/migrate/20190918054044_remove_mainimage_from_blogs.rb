class RemoveMainimageFromBlogs < ActiveRecord::Migration[5.2]
  def change
    remove_column :blogs, :main_image, :text
  end
end

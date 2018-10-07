class AddIndexToUsersEmail < ActiveRecord::Migration[5.2]
  def change
    #メールアドレスの一意性を強制する
    add_index :users, :email, unique: true
  end
end

class AddAdminToUsers < ActiveRecord::Migration[5.2]
  def change
    #　defaultを追加　デフォルトでは管理者になれないことを示すため
    add_column :users, :admin, :boolean, default: false
  end
end

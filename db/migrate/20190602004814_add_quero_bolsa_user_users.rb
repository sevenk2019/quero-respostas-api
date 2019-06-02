class AddQueroBolsaUserUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :quero_bolsa_user, :boolean
  end
end

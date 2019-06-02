class AddDefaultToPointsAndQQueroBolsaUser < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :quero_bolsa_user, :boolean, default: false
    change_column :users, :points, :integer, default: 0
  end
end

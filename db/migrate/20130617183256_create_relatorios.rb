class CreateRelatorios < ActiveRecord::Migration
  def change
    create_table :relatorios do |t|

      t.timestamps
    end
  end
end

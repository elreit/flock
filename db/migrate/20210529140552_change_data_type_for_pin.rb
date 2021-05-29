class ChangeDataTypeForPin < ActiveRecord::Migration[6.0]
  def change
    change_table :walks do |t|
      t.change :pin, :string
    end
  end
end

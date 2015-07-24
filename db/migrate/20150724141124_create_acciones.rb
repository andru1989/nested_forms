class CreateAcciones < ActiveRecord::Migration
  def change
    create_table :acciones do |t|
      t.string :accion
      t.references :tarea, index: true
    end
  end
end

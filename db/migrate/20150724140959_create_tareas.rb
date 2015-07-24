class CreateTareas < ActiveRecord::Migration
  def change
    create_table :tareas do |t|
      t.string :descripcion
      t.string :estudiante
      t.references :proyecto, index: true
    end
  end
end

class Proyecto < ActiveRecord::Base

  validates :nombre, presence: true

  has_many :tareas, dependent: :destroy
  accepts_nested_attributes_for :tareas, :reject_if => lambda { |a| a[:descripcion].blank? || a[:estudiante].blank?}, allow_destroy: true

end
class Tarea < ActiveRecord::Base

  belongs_to :proyecto

  has_many :acciones, dependent: :destroy
  accepts_nested_attributes_for :acciones, :reject_if => lambda { |a| a[:accion].blank?}, allow_destroy: true

end
class ProyectosController < ApplicationController

  before_action :set_proyecto

  def index
    @proyectos = Proyecto.all
  end

  def new
    @proyecto = Proyecto.new
  end

  def edit
  end

  def create
    @proyecto = Proyecto.new(proyecto_params)

    respond_to do |format|
      if @proyecto.save
        format.html { redirect_to proyectos_path, notice: 'Proyecto creado satisfactoriamente.' }
        format.json { render action: 'index', status: :created, location: @proyecto }
      else
        format.html { render action: 'new' }
        format.json { render json: @proyecto.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @proyecto.update(proyecto_params)
        format.html { redirect_to proyectos_path, notice: 'proyecto actualizado satisfactoriamente.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @proyecto.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def proyecto_params
    params.require(:proyecto).permit(:nombre, :descripcion,
                                    tareas_attributes: [:id, :descripcion, :estudiante, :_destroy,
                                      acciones_attributes: [:id, :accion, :_destroy]])
  end

  def set_proyecto
    @proyecto = Proyecto.find(params[:id]) if params[:id]
  end

end
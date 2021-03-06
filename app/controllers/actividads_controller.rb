class ActividadsController < ApplicationController
  before_action :authenticate_ponente!, except: [:index, :show]

  def myactividads
    @actividads = Actividad.where(idponente: current_ponente.id)
  end

  def show
   
  	@ponente = Ponente.find(current_ponente.id)

  end

  def showSolicitud
      @actividad = Actividad.find(params[:id])    
  end

  def showActividades
    begin
      @cv = CurriculumVitae.find(params[:id])
      @actividad = Actividad.find(params[:id])#?
    rescue
      @ponente = Ponente.find(current_ponente.curriculum_vitae_id)
      
    end
    
    unless @cv.id == current_ponente.curriculum_vitae_id
      redirect_to :back, :alert => "No puedes acceder."
    end

      @actividad = Actividad.find(params[:id])    
  end


  def index
    if current_usuario
      @actividads = Actividad.where("autorizado = 1 and id not in (select idactividad from registrars where idinteresado = ?)", current_usuario.id)
    else
      @actividads = Actividad.where(autorizado: 1)
    end

  end

  def new
    unless current_ponente.curriculum_vitae_id
      flash[:notice] = "Necesitas crear tu curriculum vitae para poder continuar"
      redirect_to new_curriculum_vitae_path
    end

    @actividads = Actividad.new 
    @ponente = Ponente.find(current_ponente.id)#obtenemos el ponente que esta creando la actividad
    @actividads.idponente = @ponente.id#asociamos la actividad con el id de ponente
    @areas_especializacion = AreasEspecializacion.all
    @modalidad = Modalidad.all
    @area_academica = AreaAcademica.all
    @materia = Materium.all
    @disciplina = Disciplina.all
    @publico_dirigido = PublicoDirigido.all
  end


  def create

    @paramss = parametros_f
    puts @paramss

    @actividad = Actividad.new(parametros)  #creamos un objeto 'actividad' a partir de los parametros requeridos
    @actividad.idponente = current_ponente.id
    @actividad.autorizado = 0;
    puts @actividad.to_json

    @ponente = Ponente.find(current_ponente.id)#obtenemos el ponente que esta creando la actividad
    @actividad.idponente = @ponente.id#asociamos la actividad con el id de ponente


    if @actividad.save!  #verificamos si se puede guardar
      puts @actividad.to_json

      @co = parametros_f[:contenido] #sacamos toda la info de 'contenidos'
       puts @co.to_json

      @co.each do |f| #multiples 

        @f = Contenido.new(f)  #creamos una tupla de la tabla 'contenido' a partir de los parametros requeridos
        @f.actividad_id = @actividad.id #le asignamos el id del curriculum al que pertenece

        if @f.valid? #verificamos que sea valido
          @f.save!  #guardamos
        else
          @actividad.destroy   #si esta repetidos se destruye el curriculum y se regresa a la pagina anterior
          flash[:notice] = "Contenido y calendarizacion no valido"
          redirect_to new_actividad_path
        end
      end
    

      @reqingreso = parametros_f[:requisitos_ingreso] #sacamos toda la info de 'requisitos_ingreso'
      puts @reqingreso.to_json
      @reqingreso.each do |f| #multiples 

        @f = RequisitosIngreso.new(f)  #creamos una tupla de la tabla 'contenido' a partir de los parametros requeridos
        @f.idactividad = @actividad.id #le asignamos el id del curriculum al que pertenece

        if @f.valid? #verificamos que sea valido
          @f.save!  #guardamos
        else
          @actividad.destroy   #si esta repetidos se destruye el curriculum y se regresa a la pagina anterior
          flash[:notice] = "Requisitos de ingreso no validos"
          redirect_to new_actividad_path
        end
      end

      @reqegreso = parametros_f[:requisitos_egreso] #sacamos toda la info de 'requisitos_egreso'
      puts @reqegreso.to_json
      @reqegreso.each do |f| #multiples 

        @f = RequisitosEgreso.new(f)  #creamos una tupla de la tabla 'contenido' a partir de los parametros requeridos
        @f.idactividad = @actividad.id #le asignamos el id del curriculum al que pertenece

        if @f.valid? #verificamos que sea valido
          @f.save!  #guardamos
        else
          @actividad.destroy   #si esta repetidos se destruye el curriculum y se regresa a la pagina anterior
          flash[:notice] = "Requisitos de egreso no validos"
          redirect_to new_actividad_path
        end
      end

      @reqperm = parametros_f[:requisitos_permanencia] #sacamos toda la info de 'requisitos_permanencia'
      puts @reqperm.to_json
      @reqperm.each do |f| #multiples 

        @f = RequisitosPermanencium.new(f)  #creamos una tupla de la tabla 'contenido' a partir de los parametros requeridos
        @f.idactividad = @actividad.id #le asignamos el id del curriculum al que pertenece

        if @f.valid? #verificamos que sea valido
          @f.save!  #guardamos
        else
          @actividad.destroy   #si esta repetidos se destruye el curriculum y se regresa a la pagina anterior
          flash[:notice] = "Requisitos de permanencia no validos"
          redirect_to new_actividad_path
        end
      end
    end
    redirect_to  @actividad
  end

  def edit
    begin
      @actividad = Actividad.find(params[:id])
      unless @actividad.idponente = current_ponente.id and @actividad.autorizado != 1
      flash[:notice] = "No tiene acceso."
      redirect_to current_ponente
    end
    rescue
      redirect_to current_ponente, :alert => "Verifique el id del ."
    end
  end

  private
    def parametros
      params.require(:actividad).permit(:autorizado, :nombre, :nombremodulo, :descripcion, :duracionhoras, :numerosesiones, :objetivoespecifico, :objetivogeneral, :materialdidactico, :dias, :horario, :aula, :duracion, :fechainicio, :fechafinal, :cupomaximo, :cupominimo, :metas, :costogeneral, :costoalumnos, :materialesparaalumnos, :materialesdealumnos, :idcontenido, :idponente, :idtipo, :idmodalidad, :idareaacademica, :idmateria, :iddisciplina, :idpublicodirigido, :idsede, :evaluacion)
    end

    def parametros_f
      params.require(:actividad).permit!
    end
end

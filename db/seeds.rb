# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
AreasEspecializacion.create!(area: 'Computación')
AreasEspecializacion.create!(area: 'Biología')
AreasEspecializacion.create!(area: 'Actuaría')
AreasEspecializacion.create!(:area => 'Matemáticas')
AreasEspecializacion.create!(:area => 'Física')

 Tipo.create!(:nombretipo => 'Curso')
    Tipo.create!(:nombretipo => 'Diplomado')
    Tipo.create!(:nombretipo => 'Curso Diplomado')
    Tipo.create!(:nombretipo => 'Coloquio')
    Tipo.create!(:nombretipo => 'Taller')
    Tipo.create!(:nombretipo => 'Jornada')
    Tipo.create!(:nombretipo => 'Seminario')

    Sede.create!(:nombresede => 'Yelizcalli')
    Sede.create!(:nombresede => 'Amoxcalli')
    Sede.create!(:nombresede => 'SEAyC')
    Sede.create!(:nombresede => 'CCH Naucalpan')
    Sede.create!(:nombresede => 'Departamento de física de la facultad de ciencias')

    Modalidad.create!(:nombremodalidad => 'Presencial')
    Modalidad.create!(:nombremodalidad => 'Semi Presencial')
    Modalidad.create!(:nombremodalidad => 'En linea')

     AreaAcademica.create!(:nombrearea => 'Ciencias Fisico-Matemáticas')
     AreaAcademica.create!(:nombrearea => 'Ciencias Biológicas, Químicas y de la Salud')
     AreaAcademica.create!(:nombrearea => 'Ciencias Sociales')
     AreaAcademica.create!(:nombrearea => 'Humanidades y de las Artes')
     AreaAcademica.create!(:nombrearea => 'Formación Pedagógica')

     Materium.create!(:nombremateria => 'Biología')
     Materium.create!(:nombremateria => 'Física')
     Materium.create!(:nombremateria => 'Matemáticas')
     Materium.create!(:nombremateria => 'Actuaría')


     Disciplina.create!(:nombredisciplina => 'Analisis Biogeográfico')
     Disciplina.create!(:nombredisciplina => 'Arácnidos de México (Biología)')
     Disciplina.create!(:nombredisciplina => 'Bioestadística')
     Disciplina.create!(:nombredisciplina => 'Ciencias Naturales')
     Disciplina.create!(:nombredisciplina => 'Cómputo')
     Disciplina.create!(:nombredisciplina => 'Dibujo de la Naturaleza (Ilustración)')
     Disciplina.create!(:nombredisciplina => 'Fauna Silvestre')
     Disciplina.create!(:nombredisciplina => 'Genética Forense')
     Disciplina.create!(:nombredisciplina => 'Gestión de Fondos y Administración de Proyectos')
     Disciplina.create!(:nombredisciplina => 'Herramientas en AVE')
     Disciplina.create!(:nombredisciplina => 'Impacto Ambiental')
     Disciplina.create!(:nombredisciplina => 'Informática')
     Disciplina.create!(:nombredisciplina => 'Latex y Knitr')
     Disciplina.create!(:nombredisciplina => 'Matemáticas')
     Disciplina.create!(:nombredisciplina => 'Metodología Lean-Agile')
     Disciplina.create!(:nombredisciplina => 'Solvencia II')

     PublicoDirigido.create!(:nombrepublico => 'Alumnos')
     PublicoDirigido.create!(:nombrepublico => 'Profesores')
     PublicoDirigido.create!(:nombrepublico => 'Iniciativa Privada')
     PublicoDirigido.create!(:nombrepublico => 'Sector público')

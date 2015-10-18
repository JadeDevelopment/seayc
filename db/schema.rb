# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20151012220849) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "actividads", force: :cascade do |t|
    t.integer  "autorizado"
    t.string   "nombre"
    t.string   "nombremodulo"
    t.text     "descripcion"
    t.float    "duracionhoras"
    t.integer  "numerosesiones"
    t.string   "objetivoespecifico"
    t.string   "objetivogeneral"
    t.string   "materialdidactico"
    t.text     "dias"
    t.string   "horario"
    t.string   "aula"
    t.text     "duracion"
    t.string   "fechainicio"
    t.date     "fechafinal"
    t.string   "cupomaximo"
    t.integer  "cupominimo"
    t.text     "metas"
    t.float    "costogeneral"
    t.float    "costoalumnos"
    t.text     "materialesparaalumnos"
    t.text     "materialesdealumnos"
    t.integer  "idcontenido"
    t.integer  "idponente"
    t.integer  "idtipo"
    t.integer  "idmodalidad"
    t.integer  "idareaacademica"
    t.integer  "idmateria"
    t.integer  "iddisciplina"
    t.integer  "idpublicodirigido"
    t.integer  "idsede"
    t.text     "evaluacion"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "area_academicas", force: :cascade do |t|
    t.text     "NombreArea"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "areas_especializacions", force: :cascade do |t|
    t.string   "area"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contenidos", force: :cascade do |t|
    t.integer  "NumeroTema"
    t.text     "Tema"
    t.integer  "NumeroHoras"
    t.text     "NombrePonente"
    t.date     "Fecha"
    t.integer  "IdPonente"
    t.text     "Subtemas"
    t.text     "Bibliografia"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "curriculum_vitaes", force: :cascade do |t|
    t.string   "rfc"
    t.string   "nombre"
    t.string   "apmaterno"
    t.string   "appaterno"
    t.date     "fecha_nacimiento"
    t.integer  "numero"
    t.string   "calle"
    t.string   "colonia"
    t.string   "delegacion",               default: "?"
    t.string   "ciudad"
    t.integer  "cp"
    t.string   "institucion"
    t.integer  "areas_especializacion_id"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "curriculum_vitaes", ["areas_especializacion_id"], name: "index_curriculum_vitaes_on_areas_especializacion_id", using: :btree

  create_table "curso_de_actualizacions", force: :cascade do |t|
    t.string   "nombre_curso"
    t.integer  "formacion_academica_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "curso_de_actualizacions", ["formacion_academica_id"], name: "index_curso_de_actualizacions_on_formacion_academica_id", using: :btree

  create_table "disciplinas", force: :cascade do |t|
    t.text     "NombreDisciplina"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "formacion_academicas", force: :cascade do |t|
    t.string   "area_especialidad"
    t.string   "ultimo_grado"
    t.integer  "año"
    t.string   "entidad_academica"
    t.integer  "curriculum_vitae_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "formacion_academicas", ["curriculum_vitae_id"], name: "index_formacion_academicas_on_curriculum_vitae_id", using: :btree

  create_table "materia", force: :cascade do |t|
    t.text     "NombreMateria"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "modalidads", force: :cascade do |t|
    t.text     "NombreModalidad"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "publico_dirigidos", force: :cascade do |t|
    t.text     "NombrePublico"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "reconocimientos", force: :cascade do |t|
    t.string   "nombre_reconocimiento"
    t.integer  "curriculum_vitae_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "reconocimientos", ["curriculum_vitae_id"], name: "index_reconocimientos_on_curriculum_vitae_id", using: :btree

  create_table "requisitos_egresos", force: :cascade do |t|
    t.text     "NombreRequisitosEgreso"
    t.integer  "IdPonente"
    t.integer  "IdActividad"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "requisitos_ingresos", force: :cascade do |t|
    t.text     "NombreRequisitosIngreso"
    t.integer  "IdPonente"
    t.string   "IdActividad"
    t.string   "integer"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "requisitos_permanencia", force: :cascade do |t|
    t.text     "NombreRequisitosPermanencia"
    t.integer  "IdPonente"
    t.integer  "IdActividad"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "sedes", force: :cascade do |t|
    t.text     "NombreSede"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipos", force: :cascade do |t|
    t.text     "NombreTipo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "curriculum_vitaes", "areas_especializacions"
  add_foreign_key "curso_de_actualizacions", "formacion_academicas"
  add_foreign_key "formacion_academicas", "curriculum_vitaes"
  add_foreign_key "reconocimientos", "curriculum_vitaes"
end

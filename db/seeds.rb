# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create({name: 'Admin', email: 'tutemon@gmail.com', password: '1234'})

Survey.create({name: 'Encuesta 1'})
Question.create({content:"pregunta 1", survey_id:1})
Option.create({content:"opcion1", question_id:1})
Option.create({content:"opcion2", question_id:1})
Question.create({content:"pregunta 2", survey_id:1})
Option.create({content:"opcion3", question_id:2})
Option.create({content:"opcion3", question_id:2})

Task.create({name:"tarea de encuesta", type:"SurveyTask",survey_id:1})

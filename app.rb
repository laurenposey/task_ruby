require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/task")
require('pg')

DB = PG.connect({:dbname => "to_do"})


get("/") do
  @tasks = Task.all()
  erb(:index)
end

post("/tasks") do
  name = params.fetch("name")
  task = Task.new({:name => name})
  task.save()
  erb(:success)
end

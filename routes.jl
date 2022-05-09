using Genie, Genie.Router, Genie.Renderer.Html, Genie.Requests

include("lib/systems.jl")


route("/") do
  serve_static_file("welcome.html")
end

route("/systems") do
  html(getSystem(2)*getSystem(3))
end

up()
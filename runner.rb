require "http"

response = HTTP.get("http://localhost:3000/api/recipies")
p response.parse[0]["formatted"]["ingredients"]
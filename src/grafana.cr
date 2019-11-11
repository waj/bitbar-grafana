require "http/client"
require "json"
require "./security"

hostname = {{ env("GRAFANA_HOST") }}
apikey = Security.find_generic_password(hostname, "apikey")
headers = HTTP::Headers{"Authorization" => "Bearer #{apikey}"}
response = HTTP::Client.get("https://#{hostname}/api/alerts?state=alerting", headers)
alerts = JSON.parse(response.body).as_a

if alerts.size == 0
  puts "Grafana: ✅"
else
  puts "Grafana: ‼️"
end

puts "---"
puts "Open Grafana | href=https://#{hostname}"
puts "---"
alerts.each do |alert|
  href = "https://#{hostname}#{alert["url"]}?fullscreen&panelId=#{alert["panelId"]}"
  if alert["evalData"]
    alert["evalData"]["evalMatches"].as_a.each do |match|
      puts "#{alert["name"]}: #{match["metric"]} = #{match["value"]} | color=#E45959 href=#{href}"
    end
  else
    puts "#{alert["name"]} | color=#E45959 href=#{href}"
  end
end

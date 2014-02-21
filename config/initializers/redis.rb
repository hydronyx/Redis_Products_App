# Location: config/initializers/redis.rb
conf_file = File.join('config','redis.yml')

$redis = if File.exists?(conf_file)
  conf = YAML.load(File.read(conf_file))
  #{}`echo  #{Rails.env.to_s.inspect} > /dev/pts/9`
  conf[Rails.env.to_s].blank? ? Redis.new : Redis.new(conf[Rails.env.to_s])
else
  Redis.new
end
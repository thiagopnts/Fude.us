url = ENV["REDISTOGO_URL"] or "redis://localhost:6379"
uri = URI.parse(url)
REDIS = Redis::Namespace.new("short-it", :redis => Redis.new(:host => uri.host, :port => uri.port, :password => uri.password))

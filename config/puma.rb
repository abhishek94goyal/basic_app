app_path = File.expand_path(File.expand_path(File.dirname(__FILE__)) + "/../")

num_workers = ENV["NUM_WORKERS"].to_i > 0 ? ENV["NUM_WORKERS"].to_i : 4
port = ENV["PORT"] || 3000

workers "#{num_workers}"
threads 8,32

if ENV["RACK_ENV"] == "production"
  stdout_redirect "#{app_path}/log/puma.log","#{app_path}/log/puma.err.log"
end

bind "tcp://0.0.0.0:#{port}"
pidfile "#{app_path}/tmp/pids/puma.pid"
state_path "#{app_path}/tmp/pids/puma.state"
daemonize ENV["PUMA_DAEMONIZE"] || false
preload_app!


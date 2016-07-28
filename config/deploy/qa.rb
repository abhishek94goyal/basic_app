set :stage, :production
set :log_level, :debug
set :target_stage, "production"
server '54.175.14.11',
  user: 'runner',
  roles: %w{web app db},
  ssh_options: {
    forward_agent: true
  }

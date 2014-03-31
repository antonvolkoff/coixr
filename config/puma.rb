rails_env = ENV['RAILS_ENV'] || 'development'

threads 4,4

bind  "unix:///srv/apps/chx/shared/tmp/puma/chx-puma.sock"
pidfile "/srv/apps/chx/current/tmp/puma/pid"
state_path "/srv/apps/chx/current/tmp/puma/state"

activate_control_app
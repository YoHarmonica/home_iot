# config valid only for current version of Capistrano
lock "3.8.1"

set :application, "home_iot"
set :repo_url, "git@github.com:yo-it-engineer/home_iot.git"

# Default branch is :master
ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/var/www/home_iot"

# Default value for :format is :airbrussh.
set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml", "config/secrets.yml"
append :linked_files, "config/puma.rb", "db/production.sqlite3", "db/schema.rb"

# Default value for linked_dirs is []
append :linked_dirs, "log", "tmp/cache", "public/system", "sockets", "pids"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

# capistrano3-puma の既定の再起動処理を無効化
set :puma_default_hooks, false

# puma を capistrano で利用するための設定
set :puma_preload_app, false
set :prune_bundler, true

task :restart do
  on roles(:app) do
    # Your restart mechanism here, for example:
    # execute :touch, release_path.join('tmp/restart.txt')
    invoke 'puma:phased-restart'
  end
end
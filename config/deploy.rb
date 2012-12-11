set :application, "hours.qcbs.org"
set :repository,  "git@github.com:bbttxu/cbs.git"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
default_run_options[:pty] = true  # Must be set for the password prompt
ssh_options[:forward_agent] = true

set :branch, "master"
set :repository_cache, "git_cache"
set :deploy_via, :remote_cache
# 	set :ssh_options, { :forward_agent => true }
set :user, :deploy
set :deploy_to, "/home/deploy/#{application}"

role :web, "50.56.195.123"                          # Your HTTP server, Apache/etc
role :app, "50.56.195.123"                          # This may be the same as your `Web` server
role :db,  "50.56.195.123", :primary => true # This is where Rails migrations will run
# role :db,  "your slave db-server here"

# if you want to clean up old releases on each deploy uncomment this:
after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
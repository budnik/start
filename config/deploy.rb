require "bundler/capistrano" 
set :application, 'start'
set :location, 'start'
set :repository,  :git
set :scm, :git
set :repository,  "."
set :deploy_via, :copy
set :user, "mechanic"
set :deploy_to, "/var/www/#{application}"

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`


server "48.ruby.ug", :app, :web, :db, :primary => true

namespace :deploy do
  desc "Zero-downtime restart of Unicorn"
  task :restart, :except => { :no_release => true } do
    run "kill -s USR2 `cat /var/www/#{application}/shared/pids/unicorn.pid`"
  end

  desc "Start unicorn"
  task :start, :except => { :no_release => true } do
    #run "sudo sv start #{application}"
    run "cd #{current_path}; RAILS_ENV=#{rails_env} bundle exec unicorn_rails -c config/unicorn.rb -D"
  end

  desc "Stop unicorn"
  task :stop, :except => { :no_release => true } do
    #run "sudo sv stop #{application}"
    run "kill -s QUIT `cat /var/www/#{application}/shared/pids/unicorn.pid`"
  end
end

require 'mina/multistage'
require 'mina/bundler'
require 'mina/rails'
require 'mina/git'
#require 'mina/rbenv' # for rbenv support. (http://rbenv.org)
require 'mina/rvm' # for rvm support. (http://rvm.io)
require 'mina/whenever'

# Basic settings:
#   domain       - The hostname to SSH to.
#   deploy_to    - Path to deploy into.
#   repository   - Git repo to clone from. (needed by mina/git)
#   branch       - Branch name to deploy. (needed by mina/git)

set :deploy_to, '/home/deploy/ordering'
set :repository, 'git@github.com:DimaSamodurov/ordering.git'
set :bundle_path, '/home/deploy/ordering/shared/bundle'

# For system-wide RVM install.
#   set :rvm_path, '/usr/local/rvm/bin/rvm'

# shared dirs and files will be symlinked into the app-folder by the 'deploy:link_shared_paths' step.
set :shared_dirs, fetch(:shared_dirs, []).push('log', 'upload', 'file_import')
set :shared_files, fetch(:shared_files, []).push(
  'config/secrets.yml',
  '.env',
  'db/production.sqlite3')

# Optional settings:
set :user, 'deploy' # Username in the server to SSH to.
set :forward_agent, false # SSH forward_agent.

# This task is the environment that is loaded for all remote run commands, such as
# `mina deploy` or `mina rake`.
task :environment do
  # If you're using rbenv, use this to load the rbenv environment.
  # Be sure to commit your .ruby-version or .rbenv-version to your repository.
  # invoke :'rbenv:load'

  # For those using RVM, use this to load an RVM version@gemset.
  invoke :'rvm:use', 'ruby-2.5.0@default'
end

# Put any custom commands you need to run at setup
# All paths in `shared_dirs` and `shared_paths` will be created on their own.
task :setup do
  command %{rvm install 2.4.2}
end


# Put any custom mkdir's in here for when `mina setup` is ran.
# For Rails apps, we'll make some of the shared paths that are shared between
# all releases.
task setup: :environment do
  deploy_to   = fetch(:deploy_to)
  shared_path = fetch(:shared_path)
  command %(sudo mkdir -p "#{deploy_to}")
  command %(sudo chown -R deploy:deploy "#{deploy_to}")

  command %(mkdir -p "#{shared_path}/log")
  command %(chmod g+rx,u+rwx "#{shared_path}/log")

  command %(mkdir -p "#{shared_path}/config")
  command %(chmod g+rx,u+rwx "#{shared_path}/config")

  command %(mkdir -p "#{shared_path}/db")
  command %(chmod g+rx,u+rwx "#{shared_path}/db")

  command %(mkdir -p "#{shared_path}/upload")
  command %(chmod g+rx,u+rwx "#{shared_path}/upload")

  command %(touch "#{shared_path}/config/database.yml")
  command %(touch "#{shared_path}/config/secrets.yml")
  command %(echo "-----> Be sure to edit '#{shared_path}/config/database.yml' and 'secrets.yml'.")

  command %(
    repo_host=`echo $repo | sed -e 's/.*@//g' -e 's/:.*//g'` &&
    repo_port=`echo $repo | grep -o ':[0-9]*' | sed -e 's/://g'` &&
    if [ -z "${repo_port}" ]; then repo_port=22; fi &&
    ssh-keyscan -p $repo_port -H $repo_host >> ~/.ssh/known_hosts
  )
  command %(sudo apt-get install nodejs)
end

desc 'Deploys the current version to the server.'
task deploy: :environment do
  on :before_hook do
    # Put things to run locally before ssh
  end
  deploy do
    # Put things that will set up an empty directory into a fully set-up
    # instance of your project.
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    invoke :'rails:db_migrate'
    invoke :'rails:assets_precompile'
    invoke :'deploy:cleanup'

    on :launch do
      in_path(fetch(:current_path)) do
        command %{mkdir -p tmp/}
        command %{touch tmp/restart.txt}
      end
      #invoke 'whenever:update'
    end

    on :clean do
      command 'log "failed deployment"'
    end
  end
end

# For help in making your deploy script, see the Mina documentation:
#
#  - http://nadarei.co/mina
#  - http://nadarei.co/mina/tasks
#  - http://nadarei.co/mina/settings
#  - http://nadarei.co/mina/helpers

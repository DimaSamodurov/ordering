# Server setup 

## Test server

[ordering-test.devarena.lviv.ua](http://ordering-test.devarena.lviv.ua)

- Base Image: Ubuntu Server 16.04 LTS

## Additional configuration

- Create a user

        sudo adduser deploy
        sudo usermod -a -G sudo deploy
        sudo visudo
        # then add
        deploy ALL=(ALL) NOPASSWD: ALL
        
        sudo su deploy

- Install RVM

        sudo su deploy
        sudo apt-get install libgdbm-dev libncurses5-dev automake libtool bison libffi-dev
        gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
        curl -sSL https://get.rvm.io | bash -s stable
    
        #add to ~/.bashrc
        [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
    
        source /home/deploy/.rvm/scripts/rvm
    

- Install Ruby: https://gorails.com/setup/ubuntu/16.04 (select RVM option)

        rvm install ruby-2.4.2
        rvm use 2.4.2 --default
        echo 'gem: --no-ri --no-rdoc' > ~/.gemrc
        gem install bundler

- Install Passenger: https://www.phusionpassenger.com/library/install/nginx/install/oss/xenial/

        sudo apt-get install -y dirmngr gnupg
        sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 561F9B9CAC40B2F7
        sudo apt-get install -y apt-transport-https ca-certificates
        sudo sh -c 'echo deb https://oss-binaries.phusionpassenger.com/apt/passenger xenial main > /etc/apt/sources.list.d/passenger.list'
        sudo apt-get update
        sudo apt-get install -y nginx-extras passenger
    
- Enable passenger module
    
        # Edit /etc/nginx/nginx.conf and uncomment `include /etc/nginx/passenger.conf;`

- Restart Nginx
    
        sudo service nginx restart        
        sudo /usr/bin/passenger-config validate-install
        sudo /usr/sbin/passenger-memory-stats
    
- Configure Git

        mkdir ~/.ssh
        copy there keys ssu_deploy and ssu_deploy.pub 
        
        chmod 400 /home/deploy/.ssh/ssu_deploy
        nano ~/.ssh/config
        # add the following lines there:
        host github.com
          User git
          IdentityFile  ~/.ssh/ssu_deploy
        
        # Verify git connection
        ssh -T git@github.com
        # The output should be:
        # Hi ssu-deploy! You've successfully authenticated, but GitHub does not provide shell access.


- Prepare deployment
      
        # Ensure your public key is added to `/home/deploy/.ssh/authorized_keys` on the server.

        # Run once locally: 
        mina test setup
        
        # Generate production secret locally
        rake secret
        # copy the output value
        
        # Update `/home/deploy/ordering/shared/config/secrets.yml` on the server to contain:

            production:
              secret_key_base: <value>
        
- Deployment      
  
        # that is easy 
        mina test deploy

- Seed initial data on the server
        
        mina test environment rake[db:seed]

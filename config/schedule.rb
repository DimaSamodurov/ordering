# http://github.com/javan/whenever
set :output, './log/cron.log'
env :PATH, '/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin'

app = 'cd /home/deploy/ordering/current && RAILS_ENV=production bundle exec '

every 1.day, :at => '4:00 am' do
  #command "#{app} rake ordering:synchronize_products --silent"
end

every 1.day do
  rake "products:update"
end

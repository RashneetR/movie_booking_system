set :environment, 'production'
set :output, 'log/whenever.log'

every 1.month do
  rake 'delete_old_users'
end

# frozen_string_literal: true

set :environment, 'development'
set :output, 'log/whenever.log'

every 1.month do
  rake 'delete_old_users'
end

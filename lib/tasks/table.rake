namespace :table do
  db_config = Rails.application.config.database_configuration[Rails.env]
  db_dir = Rails.root.join('db','backups')
  system "mkdir -p "+db_dir.to_s
  
  desc "TODO"
  task backup: :environment do
     system "mysqldump -u#{db_config['username']} -p#{db_config['password']} #{db_config['database']} users | gzip > "+db_dir.to_s+"/users.sql.gz"
  end

  desc "TODO"
  task restore: :environment do
     system "gunzip < "+db_dir.to_s+"/users.sql.gz | mysql -u#{db_config['username']} -p#{db_config['password']} #{db_config['database']}"
  end

end

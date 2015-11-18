# In SeedStatus table: true->seeding has started, false->seeding is done
begin
  seed_start = SeedStatus.create(status: true)
rescue ActiveRecord::RecordNotUnique
  if SeedStatus.exists?(status: false)
    puts '===Seeding is already done.'
  else
    puts '===Seeding is being executed by another instance.'
  end
else
  puts '===This is the only one instance that is seeding the data...'

  load(Rails.root.join( 'db', 'seeds', "#{Rails.env.downcase}.rb"))
  # load(Rails.root.join( 'db', 'seeds', 'production.rb'))
  seed_done = SeedStatus.create(status: false)
  puts '===Seeding is done.'
end

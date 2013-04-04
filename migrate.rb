# migrate.rb

def migrate
  shops = YAML.load_file("test/fixtures/shops.yml")
  shops.each do |key,obj|
    s = Shop.new
    s.location = obj['location']
    s.ends_at = obj['ends_at']
    s.starts_at = obj['starts_at']
    s.migration_key = key
    s.save
  end

  volunteers = YAML.load_file("test/fixtures/volunteers.yml")
  volunteers.each do |key,obj|
    v = Volunteer.new
    v.first_name = obj['first_name']
    v.last_name = obj['last_name']
    v.email = obj['email']
    v.migration_key = key
    v.save
  end

  sessions = YAML.load_file("test/fixtures/sessions.yml")
  sessions.each do |key,obj|
    shop = Shop.where(:migration_key => obj["shop"]).first
    volunteer = Volunteer.where(:migration_key => obj["volunteer"]).first

    puts key
    s = Session.new
    s.starts_at = obj['starts_at']
    s.ends_at = obj['ends_at']
    s.volunteer_id = volunteer.id
    s.shop_id = shop.id
    s.migration_key = key
    s.save
  end
end
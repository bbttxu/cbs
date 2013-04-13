# process.rb
file = []

File.open("data2013.csv").each do |line|
  file << line.split("\t")
end


shop_times = Hash.new { |hash, key| hash[key] = [] }
file.collect do |line|
  [3, 4].each do |index|
    shop_times[line[0]] << Chronic.parse( "#{line[0]} #{line[index].strip}") if  line[index]
  end
end

shops = Hash.new { |hash, key| hash[key] = [] }
shop_times.each do |day, times|
  shop = Shop.find_by_starts_at_and_ends_at( times.min(), times.max())
  unless shop
    shop = Shop.new
    shop.starts_at = times.min()
    shop.ends_at = times.max()
    shop.location = "215 West Oak Street"
    shop.save
  end
  shops[day] = shop.id
end

file.each do |line|
  puts line[1]
end
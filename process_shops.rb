# process.rb

file = []
skipped = []

File.open("data2013.csv").each do |line|
  file << line.split("\t").collect{|x|x.strip}
end


shop_times = Hash.new { |hash, key| hash[key] = [] }
file.collect do |line|
  [3, 4].each do |index|
    shop_times[line[0]] << Chronic.parse( "#{line[0]} #{line[index].strip}") if  line[index]
  end
end

shops = Hash.new { |hash, key| hash[key] = [] }

# puts shop_times.to_yaml

shop_times.each do |day, times|
  # puts day
  # puts times
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
  begin
    parts = line[1].split(/\s/)
    volunteer = Volunteer.find_by_first_name_and_last_name( parts[0], parts[1])
    parts = line[1].split(/\s/) if line[1]
    skipped << line unless line[1]
    volunteer = Volunteer.find_by_first_name_and_last_name( parts[0], parts[1])
    unless volunteer
      volunteer = Volunteer.new
      volunteer.first_name = parts[0]
      volunteer.last_name = parts[1]
      unless volunteer.save
        puts "skipping volunteer #{line}"
        skipped << line
        next
      end
    end

    session = Session.find_by_volunteer_and_shop( volunteer.id, shops[line[0]])
    unless session
      session = Session.new
      session.volunteer_id = volunteer.id
      session.shop_id = shops[line[0]] if line[1]
      session.starts_at =  Chronic.parse("#{line[0]} #{line[3]}").to_time.iso8601
      session.ends_at = nil
      session.ends_at = Chronic.parse("#{line[0]} #{line[4]}").to_time.iso8601 if line[4]
      unless line[4]
        puts "skipping session #{line}"
        skipped << line
        next
      end
      # puts session.starts_at
      # puts session.ends_at
      # session.ends_at = line[3] unless line[4]
      session.reason_for_visit = line[2]
      session.is_volunteer = false
      session.is_volunteer = true if line[2].match(/(coordinator|manager|volunteer|greeter)/i)
      unless session.save
        puts "skipping #{parts}"
        skipped << line
      end
    end

  rescue Exception => e
    skipped << line
    puts "X #{line}"
  end

end
File.open("rejected.csv", "w") do |output|
  output << skipped.collect{|x|x.join("\t")}.join("\n")
end
class Volunteer
  include MongoMapper::Document
  plugin MongoMapper::Plugins::IdentityMap

  key :first_name, String, :required => true
  key :last_name, String, :required => true
  key :email, String, :uniqueness => true, :allow_blank => true, :email => true
  key :can_email, Boolean
  key :phone_number, String, :allow_blank => true, :phone_number => true
  key :migration_key, String
  timestamps!

	many :sessions
	many :shops

	def name
		[self.first_name, self.last_name].reject{|x|x == ""}.join(" ")
	end

	def open_sessions
		sessions.open
	end

  def last_name_initial
    self.last_name == "" ? "?" : self.last_name[0].upcase
  end

  def last_active(since = nil)
    latest = sessions.latest.limit(1).all

    latest.reject!{|session| session['starts_at'] < since} if since

    return false if latest.count == 0
    latest[0]['starts_at']
  end
end

Volunteer.ensure_index(:last_name)

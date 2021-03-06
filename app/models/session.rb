
class Session
  include MongoMapper::Document
  plugin MongoMapper::Plugins::IdentityMap

  belongs_to :shop, :required => true
  belongs_to :volunteer, :required => true

  key :starts_at, Time, :default => Time.now()
  key :ends_at, Time, :default => nil
  key :reason_for_visit, String
  key :notes, String
  key :migration_key, String
  key :is_volunteer, Boolean, :default => false
  timestamps!

	scope :current, where( "ends_at" => nil)
	scope :open, :current

  scope :are_volunteer, where({is_volunteer: true})
  scope :are_visitor, where({is_volunteer: false})
  scope :last_year,  lambda { where(:ends_at.gte => Time.zone.now - 1.year) }
  scope :latest, sort(:ends_at)

	def hours_worked
		ending_time = self.ends_at ? self.ends_at : Time.now

		return ((ending_time - self.starts_at).to_f / 36).to_i / 100.0
	end

end

Session.ensure_index(:is_volunteer)
Session.ensure_index(:starts_at)
Session.ensure_index(:ends_at)
Session.ensure_index(:volunteer_id)
Session.ensure_index(:shop_id)


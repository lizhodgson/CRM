class Rolodex
	def initialize
		@contacts = []
		@@id = 1000
	end

	def contacts
		@contacts
	end

	def add_contact(contact)
		contact.id = @@id
		@contacts << contact
		@@id += 1	
	end

	def current_id
		@@id
	end

	def display_contacts
		contacts.each do |c|
			puts "Name #{c.first_name} #{c.last_name}"
			puts "Email #{c.email}"
			puts "Note #{c.note}"
			puts "ID #{c.id}"
		end	
	end

	def find_contact(id)
		@contacts.select{ |contact| contact.id == id}.first
	end

	def display_contact(id)
		c = find_contact(id)
		puts "Name #{c.first_name} #{c.last_name}"
		puts "Email #{c.email}"
		puts "Note #{c.note}"
		puts "ID #{c.id}"
	end

	def display_info_by_attribute
	end

	def delete_contact(id)
		contact = find_contact(id)
		@contacts.delete(contact)
	end
end
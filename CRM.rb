require_relative './rolodex.rb'
require_relative './contact.rb'
class CRM
	
	attr_reader :name

	def initialize(name)
		puts "Okay, this CRM has the name " + name
		@name = name
		@rolodex = Rolodex.new
	end

	def print_main_menu
		puts "[1] Add a contact"
		puts "[2] Modify a contact"
		puts "[3] Display all contacts"
		puts "[4] Display one contact"
		puts "[5] Display an attribute"
		puts "[6] Delete a contact"
		puts "[7] Exit"
		puts "Enter a number:"
	end

	def main_menu
		puts "Welcome to #{@name}"

		while true
			print_main_menu
			input = gets.chomp.to_i
			choose_option(input)
			return if input == 7
		end

	end

	def choose_option (option)
		case option
		when 1 then add_contact
		when 2 then modify_contact
		when 3 then display_contacts
		when 4 then display_contact
		when 5 then display_info_by_attribute
		when 6 then delete_contact
		when 7
			puts "Goodbye"
			return
		else 
			puts "Incorrect option, try again."
		end
	end

	def add_contact
		puts "Provide contact details"
		
		print "First Name: "
		first_name = gets.chomp
		
		print "Last Name: "
		last_name = gets.chomp

		print "Email: "
		email = gets.chomp

		print "Note: "
		note = gets.chomp

		puts "Your id is: #{@rolodex.current_id} "

		new_contact = Contact.new(first_name, last_name, email, note)
		@rolodex.add_contact(new_contact)

	end

	def modify_contact
		puts "Please enter which aspect of your contact information you would like to change"
		
	end

	def display_contact
		puts "Please enter the customer ID you wish to display."
		id = gets.chomp.to_i
		@rolodex.display_contact(id)
	end

	def display_contacts
		@rolodex.display_contacts
	end

	def display_info_by_attribute
		puts "Please enter which ID you wish to view."
		id = gets.chomp.to_i

	end

	def delete_contact
		puts "Please enter the id you wish to delete."
		id = gets.chomp.to_i
		puts "Are you sure? [Y or N]"
		y_or_n = gets.chomp
		if y_or_n == "Y"
			@rolodex.delete_contact(id)
		end	
	end

end
bitmaker = CRM.new("Bitmaker Labs CRM")
bitmaker.main_menu
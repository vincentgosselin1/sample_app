# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  name               :string
#  email              :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  encrypted_password :string
#  salt               :string
#

class User < ActiveRecord::Base

	attr_accessor :password

	email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :name, :presence => true,
					 :length => { :maximum => 50 }

	validates :email, :presence => true,
					  :format => { :with => email_regex },
					  :uniqueness => { :case_sensitive => false }

	#Automatically creates the virtual attribute 'password_confirmation'.
	validates :password, :presence => true,
						 :confirmation => true,
					     :length => { :within => 6..40 }

	before_save :encrypt_password

	#Return true if the user's password matches the submitted password.
	def has_password?(submitted_password)
		# Compare encrypted_password with the encrypted version of
		# submitted_passwords
		encrypted_password == encrypt(submitted_password)
	end
	
	private

		def encrypt_password
			self.salt = make_salt if new_record?
			self.encrypted_password = encrypt(password)
		end

		def encrypt(string)
			secure_hash("#{salt}--#{string}")
		end

		def make_salt
			secure_hash("#{Time.now.utc}--#{password}")
		end

		def secure_hash(string)
			Digest::SHA2.hexdigest(string)
		end
end

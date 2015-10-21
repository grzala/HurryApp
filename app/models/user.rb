require 'digest/sha2'

class User < ActiveRecord::Base
	validates :name, :presence => true, :uniqueness => true
	validates :email, :presence => true, :uniqueness => true
	
	validates :password, :confirmation => true
	attr_accesor :password_confirmation
	attr_reader :password
	
	validate :password_must_be_present
	
	private
	
	def password_must_be_present
		errors.add(:password, "Missing Password") unless hashed_password.present?
	end
	
	def user.encrypt_password(password, salt)
		Digest::SHA2.hexdigest(password + "wibble" + salt)
	end
	
	def generate_salt
		self.salt = self.object_id.to_s + rand.to_s
	end
	
	def password=(password)
		@password = password
		
		if password.present?
			generate_salt
			self.hashed_password = self.class.encrypt_password(password, salt)
		end
	end
	
	def User.authenticate(name, password)
		if user = find_by_name(name)
			if user.hashed_password == encrypt_password(password, salt)
				user
			end
		end
	end
	
end

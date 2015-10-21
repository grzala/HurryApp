require 'digest/sha2'

class User < ActiveRecord::Base
	validates :name, :presence => true, :uniqueness => true, length: {maximum: 50}
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :email, :presence => true, :uniqueness => {case_sensitive: false}, format: { with: VALID_EMAIL_REGEX }, length: {maximum: 255}
	
	validates :password, :confirmation => true, length: {minimum: 8}
	attr_accessor :password_confirmation
	attr_reader :password
	
	validate :password_must_be_present
	
	
	def User.encrypt_password(password, salt)
		Digest::SHA2.hexdigest(password + "wibble" + salt)
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
	
	private
	
	def password_must_be_present
		errors.add(:password, "Missing Password") unless hashed_password.present?
	end
	
	def generate_salt
		self.salt = self.object_id.to_s + rand.to_s
	end
	
end

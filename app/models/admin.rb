class Admin < ActiveRecord::Base
	attr_accessor :password, :email, :name
#	attr_accessible :name
	
	validates :name, :presence => true
							
	validates :password, :presence => true, :confirmation => true, :length => { :within => 6..40 }


before_save :encrypt_password, :set_email

 def has_password?(submitted_password)
   encrypted_password == encrypt(submitted_password)
 end

	def self.authenticate(email, submitted_password)
		admin = find_by_email email
		return nil if admin.nil?
		return admin if admin.has_password?(submitted_password)
	end

 private

   def encrypt_password
     self.salt = make_salt unless has_password?(password)
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

	def set_email
		email_pre = "@joyblind.com"
		self.email = name.split(' ')[0].downcase + email_pre
	end

end

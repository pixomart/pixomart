require 'digest/sha1'
class Admin < ActiveRecord::Base
  
  #prevent mass assignment of passowrd related information
  attr_protected :password, :salt
  
  #sets the .passowrd property/attribute for Admin Class.
  #Note: it does not interfare with DB, but its just a runtime property
  attr_accessor :password 
  
  #Relationship declearation, Collection of Logs for Admin
  has_many :logs

  #Relationship declearation, Collection of Logs for Admin
  
  #Validations on admin creation
  #validates email
  validates_presence_of :email, :message => "can't be blank"
  validates_uniqueness_of :email, :message => "must be unique"
  validates_format_of :email, :with => EMAIL_REGEX, :message => "invalid email address"
  validates_confirmation_of :email, :message => "should match confirmation"
  
  #validates name 
  validates_presence_of :name, :message => "can't be blank"
  validates_length_of :name, :within => 3..50, :message => "must be 3 to 50"
  
  #Validates password
  validates_presence_of :password, :message => "can't be blank"
  validates_length_of :password, :within => 4..50, :on => :create, :message => "must be 4 to 50 charecters long"
  
  #set call-backs to the 'create' method of the admin object so that we can integrate secure password, & when done clear them.
  before_save :create_hashed_password
  after_save :clear_password
  
  # Hashes the supplied salt (username in this case) and adds randomness (time stamp) to it.
  def self.make_salt(name="")
      Digest::SHA1.hexdigest("Uses #{name} With #{Time.now} to generate the Salt")
  end
   
  # Hashes the supplied password with supplied salt.
  def self.hash_with_salt(password="", salt="")
    Digest::SHA1.hexdigest("Put some #{salt} on #{password}")
  end
  
  
  def self.authenticate(email="", password="")
      admin = Admin.find_by_email(email)
      if admin && admin.password_match?(password)
          return admin
      else
          return false
      end
  end
  
  def password_match?(password="")
      encrypted_password == Admin.hash_with_salt(password, password_salt)
  end
  
  #Private methods
  private
  
  # private Method for callback before save
  def create_hashed_password
      
      unless password.blank?
          self.password_salt = Admin.make_salt(name) if password_salt.blank?
          self.encrypted_password = Admin.hash_with_salt(password, password_salt)
      end
  end
  
  #private Method for callback after save
  def clear_password
      password =""
  end
end
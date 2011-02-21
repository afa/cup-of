class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :username

  attr_accessor :login
  attr_accessible :login
  has_many :purcases

  attr_accessor :join_cart
  attr_accessible :join_cart
 protected
  def self.find_for_database_authentication(conditions)
   login = conditions.delete(:login)
   where(conditions).where(["#{table_name}.username = :value OR #{table_name}.email = :value", { :value => login }]).first
  end

  def self.send_reset_password_instructions(attributes={})
   recoverable = find_recoverable_or_initialize_with_errors(reset_password_keys, attributes, :not_found)
   recoverable.send_reset_password_instructions if recoverable.persisted?
   recoverable
  end 

  def self.find_recoverable_or_initialize_with_errors(required_attributes, attributes, error=:invalid)
   case_insensitive_keys.each { |k| attributes[k].try(:downcase!) }

   attributes = attributes.slice(*required_attributes)
   attributes.delete_if { |key, value| value.blank? }

   if attributes.size == required_attributes.size
     if attributes.has_key?(:login)
        login = attributes.delete(:login)
        record = find_record(login)
     else  
       record = where(attributes).first
     end  
   end  

   unless record
     record = new

     required_attributes.each do |key|
       value = attributes[key]
       record.send("#{key}=", value)
       record.errors.add(key, value.present? ? error : :blank)
     end  
   end  
   record
  end

  def self.find_record(login)
   where(attributes).where(["username = :value OR email = :value", { :value => login }]).first
  end
end

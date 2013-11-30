class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable

  has_many :user_roles
  has_many :roles, through: :user_roles

  def has_role?(role)
    user_roles = roles.collect{ |r| r.name.to_sym }
    user_roles.include?(role.to_sym)
  end

end

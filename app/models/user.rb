class User < ApplicationRecord
    has_secure_password
    has_many  :reports, dependent: :destroy

    validates :email, presence: true, uniqueness: true
    validates :name, presence: true
    validates :password, length: {minimum: 4}
end



# class User < ApplicationRecord
#     has_secure_password
  
#     validates :email, presence: true, uniqueness: true
#     validates :name, presence: true
#     validates :password, length: { minimum: 6 }
#   end
  

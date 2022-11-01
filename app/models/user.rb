class User < ApplicationRecord
    has_secure_password
    has_one_attached :image
    # validate :apply_validation
    # validates_presence_of :password#, presence: { message: "Password Can't be blank" }

    # validates :password, presence: { message: "Password Can't be blank" }, on: :create
    # validates :password, presence: { message: "Password Can't be blank" }, on: :update

    # private
    # def apply_validation
    #     debugger
    #     if self.password == nil
    #         errors.add(:password, "Password can't be blank")
    #     end
    # end
end
 
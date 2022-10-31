class AddOtpVerifiedToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :otp_verified, :boolean, default: false
  end
end

class User < ActiveRecord::Base
	validates :username, presence: true
	validates :username, uniqueness: true
	validates :fullname, presence: true
	validates :age, presence: true, numericality: { :greater_than => 0, :less_than => 150 }

	has_secure_password

	before_save { 
		username.downcase! 
	}

	def get_avatar
		read_attribute(:avatar_url).presence || "http://zizaza.com/cache/icon_256/iconset/581392/581398/PNG/256/rhombus/talk_flat_design_icon_png_flat_icon_talk_icon_talk_png.png"
	end
end

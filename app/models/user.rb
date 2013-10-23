class User < ActiveRecord::Base
	validates :username, presence: true
	validates :username, uniqueness: true
	validates :fullname, presence: true
	validates :age, presence: true, numericality: { :greater_than => 0, :less_than => 150 }

	has_secure_password

	before_save { username.downcase! }
	before_create :create_remember_token

	has_many :teams, foreign_key: "creator_id", dependent: :destroy
	has_many :memberships, class_name: "Teammember", foreign_key: "member_id", dependent: :destroy

	default_scope -> { order('fullname') }

	def get_avatar
		read_attribute(:avatar_url).presence || "http://zizaza.com/cache/icon_256/iconset/581392/581398/PNG/256/rhombus/talk_flat_design_icon_png_flat_icon_talk_icon_talk_png.png"
	end

	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def User.encrypt(token)
		Digest::SHA1.hexdigest(token.to_s)
	end

	def current_user?(other_user)
		current_user == other_user
	end

	private

	def create_remember_token
		self.remember_token = User.encrypt(User.new_remember_token)
	end
end

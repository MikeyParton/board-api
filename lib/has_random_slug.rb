module HasRandomSlug
  def self.included(base)
    base.extend FriendlyId
    base.friendly_id :generate_slug, use: :slugged
    base.extend ClassMethods
  end

  module ClassMethods
    def has_random_slug
      define_method "generate_slug" do
        new_slug = loop do
          random = SecureRandom.hex(5)
          break random unless self.class.friendly.exists?(random)
        end
      end
    end
  end
end

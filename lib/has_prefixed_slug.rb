module HasPrefixedSlug
  SEPERATOR = "-"

  # We like to prefix the slug with a unique number to easily reference
  # in git commits. Once set, this number can not change. So on subsequent
  # updates we only change the main slug basis if it has changed.

  def self.included(base)
    base.extend FriendlyId
    base.friendly_id :generate_slug, use: :slugged
    base.extend ClassMethods
  end

  def slug_prefix
    return nil if self.slug.blank?
    self.slug.split(SEPERATOR)[0..1].join(SEPERATOR)
  end

  module ClassMethods
    def has_prefixed_slug(basis, new_prefix)
      define_method "should_generate_new_friendly_id?" do
        self.slug.blank? || self.send("#{basis}_changed?")
      end

      define_method "next_prefix" do
        return slug_prefix if slug.present?
        number = self.send(new_prefix)
        [number, SecureRandom.hex(5)].join(SEPERATOR)
      end

      define_method "generate_slug" do
        id =  self.send("next_prefix")
        main = self.send(basis).parameterize
        [id, main].join(SEPERATOR)
      end
    end
  end
end

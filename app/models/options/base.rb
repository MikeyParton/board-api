module Options
  class Base
    def initialize(option)
      @option = option
    end

    def self.options(*options)
      @options ||= options
    end

    def self.option_attributes(*keys)
      base_locale_scope = self.name.split("::").map(&:downcase)

      keys.each do |key|
        define_method(key) do
          I18n.t @option, scope: base_locale_scope + [key]
        end
      end

      define_method(:to_model) do
        hash = keys.inject({}) do |result, currentKey|
          result[currentKey] = self.send(currentKey)
          result
        end
        hash
      end
    end

    def self.all
      @options.map { |option| self.new(option).to_model }
    end
  end
end

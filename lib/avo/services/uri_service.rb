module Avo
  module Services
    class URIService
      class << self
        def parse(path)
          self.new path
        end
      end

      attr_reader :uri

      def initialize(path = '')
        @uri = Addressable::URI.parse(path)
      end

      def append_paths(*paths)
        paths = Array.wrap(paths)

        # abort 11.inspect

        return self if paths.blank?
        # abort 12.inspect

        @uri.merge!(path: @uri.path.concat("/#{paths.join("/")}"))
        self
      end
      alias_method :append_path, :append_paths

      def append_query(*params)
        params = Array.wrap(params)

        @uri.merge!(query: [@uri.query, *params].join("&"))
        self
      end

      def to_s
        @uri.to_s
      end
    end
  end
end

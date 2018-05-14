require "http"

module HTTP
  struct Params

    # Works with the body param of http
    module Body

      # Extracts the body from a request and cast it to string
      #
      # TODO: `URI.unescape` is returning a extraneous `=' at the end of the
      #       unescaped string, hence the String#chomp call
      def self.extract(req : HTTP::Request, unescape=false) : String
        res = parse_part(req.body).not_nil!
        if res && unescape
          return URI.unescape(res.to_s).chomp("=")
        end
        res.to_s.chomp("=")
      end

      # Parses an HTTP query string into a `HTTP::Params`
      def self.parse_part(in : IO) : HTTP::Params
        HTTP::Params.parse(in.gets_to_end)
      end

      # Parses an HTTP query string into a `HTTP::Params`
      def self.parse_part(in : String) : HTTP::Params
        HTTP::Params.parse(in)
      end

      # Parses an HTTP query string into a `HTTP::Params`
      def self.parse_part(in : Nil) : HTTP::Params
        HTTP::Params.parse("")
      end
    end
  end
end

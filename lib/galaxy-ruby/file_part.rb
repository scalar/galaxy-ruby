# frozen_string_literal: true

module ScalarGalaxy
  class FilePart
    # @return [Pathname, StringIO, IO, String]
    attr_reader :content

    # @return [String, nil]
    attr_reader :content_type

    # @return [String, nil]
    attr_reader :filename

    # @api private
    #
    # @return [String]
    private def read
      case content
      in Pathname
        content.read(binmode: true)
      in StringIO
        content.string
      in IO
        content.read
      in String
        content
      end
    end

    # @param a [Object]
    #
    # @return [String]
    def to_json(*a) = read.to_json(*a)

    # @param a [Object]
    #
    # @return [String]
    def to_yaml(*a) = read.to_yaml(*a)

    # The filename sent for a part is only ever a basename: an open `File` knows the full local path
    # it was opened from, which is the caller's business and not the server's.
    #
    # The content type is written into the part's headers as given, so one carrying a control
    # character (a CR or LF would start a header line of its own) is refused here, before any request.
    #
    # @param content [Pathname, StringIO, IO, String]
    # @param filename [Pathname, String, nil]
    # @param content_type [String, nil]
    #
    # @raise [ArgumentError] when `content_type` contains a control character
    def initialize(content, filename: nil, content_type: nil)
      if content_type&.to_s&.match?(/[\x00-\x1F\x7F]/)
        raise ArgumentError.new("The content type #{content_type.inspect} contains a control character.")
      end

      @content_type = content_type
      @filename =
        case [filename, (@content = content)]
        in [String | Pathname, _]
          ::File.basename(filename)
        in [nil, Pathname]
          content.basename.to_path
        in [nil, IO]
          content.respond_to?(:to_path) ? ::File.basename(content.to_path) : nil
        else
          filename
        end
    end
  end
end

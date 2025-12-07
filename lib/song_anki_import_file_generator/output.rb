module SongAnkiImportFileGenerator
  class Output
    attr_reader :path, :cards

    def initialize(path)
      @path = path
      @cards = []
    end

    def write
      File.write(@path, @cards.join("\n"))
    end
  end
end

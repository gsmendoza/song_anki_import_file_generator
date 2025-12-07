module SongAnkiImportFileGenerator
  class Line
    def initialize(text)
      @text = text
    end

    def to_card
      %{(First line,"#{@text}"}
    end
  end
end

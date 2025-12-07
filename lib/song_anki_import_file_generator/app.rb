module SongAnkiImportFileGenerator
  class App
    def initialize(input_path:, output_path:)
      @input_path = input_path
      @output_path = output_path
    end

    def call
      content = File.read(@input_path)
      output = Output.new(@output_path)

      Song.new(content).stanzas.each do |stanza|
        stanza.lines.each do |line|
          output.cards << line.to_card
        end
      end

      output.write

      output.path
    end
  end
end

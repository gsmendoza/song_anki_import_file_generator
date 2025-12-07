module SongAnkiImportFileGenerator
  class App
    def initialize(input_path:, output_path:)
      @input_path = input_path
      @output_path = output_path
    end

    def call
      File.write(@output_path, "")
      @output_path
    end
  end
end

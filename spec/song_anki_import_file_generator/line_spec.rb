require "spec_helper"

RSpec.describe SongAnkiImportFileGenerator::Line do
  describe "#to_card" do
    let(:song) { SongAnkiImportFileGenerator::Song.new }

    context "when the stanza is the first stanza of the song" do
      let(:stanza) { SongAnkiImportFileGenerator::Stanza.new(title: "Intro") }

      before do
        song.add_stanza(stanza)
      end

      context "when the line is the first line of the stanza" do
        let(:line) { described_class.new(text: "...         Then off to reap the corn,") }

        before do
          stanza.add_line(line)
        end

        it "sets the front of the card to 'First Line'" do
          card = line.to_card

          expect(card.front).to eq("First Line")
          expect(card.back).to eq("Intro\n...         Then off to reap the corn,")
        end
      end

      context "when some line i is not the first line of the stanza" do
        let(:lines) do
          [
            described_class.new(text: "...         Then off to reap the corn,"),
            described_class.new(text: "...         and leave where I was born")
          ]
        end

        let(:line_i) { lines[1] }

        before do
          lines.each do |line|
            stanza.add_line(line)
          end
        end

        it "sets the front of the card to the line previous to line i" do
          card = line_i.to_card

          expect(card.front).to eq("Intro\n...         Then off to reap the corn,")
          expect(card.back).to eq("Intro\n...         and leave where I was born")
        end
      end
    end
  end
end

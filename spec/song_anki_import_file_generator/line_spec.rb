require "spec_helper"

RSpec.describe SongAnkiImportFileGenerator::Line do
  describe "#to_card" do
    let(:song) { SongAnkiImportFileGenerator::Song.new(artist: "Sinners", title: "Rocky Road to Dublin") }

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

        it "sets the front of the card to '0. First Line'" do
          card = line.to_card

          expect(card.front).to eq("Sinners - Rocky Road to Dublin\n0. First Line")
          expect(card.back).to eq("1. Intro\n1. ...         Then off to reap the corn,")
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

          expect(card.front).to eq("Sinners - Rocky Road to Dublin\n1. Intro\n1. ...         Then off to reap the corn,")
          expect(card.back).to eq("1. Intro\n2. ...         and leave where I was born")
        end
      end
    end

    context "when stanza i is not the first stanza of the song" do
      let(:stanzas) do
        [
          SongAnkiImportFileGenerator::Stanza.new(title: "Intro"),
          SongAnkiImportFileGenerator::Stanza.new(title: "Verse")
        ]
      end

      let(:stanza_i) { stanzas[1] }

      before do
        stanzas.each do |stanza|
          song.add_stanza(stanza)
        end
      end

      context "when the line is the first line of stanza i" do
        let(:previous_line) { described_class.new(text: "..          four, five") }
        let(:line) { described_class.new(text: "<Am>--      Well, in the merry month of May,") }

        before do
          stanzas[0].add_line(previous_line)
          stanza_i.add_line(line)
        end

        it "sets the front of the card to the last line of the previous stanza" do
          card = line.to_card

          expect(card.front).to eq("Sinners - Rocky Road to Dublin\n1. Intro\n1. ..          four, five")
          expect(card.back).to eq("2. Verse\n1. &lt;Am&gt;--      Well, in the merry month of May,")
        end
      end
    end
  end

  describe "#to_s" do
    it "returns the text of the line" do
      line = described_class.new(text: "...         Then off to reap the corn,")

      stanza = SongAnkiImportFileGenerator::Stanza.new(title: "Intro")
      stanza.add_line(line)

      song = SongAnkiImportFileGenerator::Song.new
      song.add_stanza(stanza)

      expect(line.to_s).to eq("1. Intro\n1. ...         Then off to reap the corn,")
    end
  end
end

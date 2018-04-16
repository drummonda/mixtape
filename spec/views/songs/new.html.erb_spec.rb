require 'rails_helper'

RSpec.describe "songs/new", type: :view do
  before(:each) do
    assign(:song, Song.new(
      :song_title => "MyString",
      :song_artist => "MyString",
      :playlist_id => nil
    ))
  end

  it "renders new song form" do
    render

    assert_select "form[action=?][method=?]", songs_path, "post" do

      assert_select "input[name=?]", "song[song_title]"

      assert_select "input[name=?]", "song[song_artist]"

      assert_select "input[name=?]", "song[playlist_id_id]"
    end
  end
end

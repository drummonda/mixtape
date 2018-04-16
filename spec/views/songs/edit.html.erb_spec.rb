require 'rails_helper'

RSpec.describe "songs/edit", type: :view do
  before(:each) do
    @song = assign(:song, Song.create!(
      :song_title => "MyString",
      :song_artist => "MyString",
      :playlist_id => nil
    ))
  end

  it "renders the edit song form" do
    render

    assert_select "form[action=?][method=?]", song_path(@song), "post" do

      assert_select "input[name=?]", "song[song_title]"

      assert_select "input[name=?]", "song[song_artist]"

      assert_select "input[name=?]", "song[playlist_id_id]"
    end
  end
end

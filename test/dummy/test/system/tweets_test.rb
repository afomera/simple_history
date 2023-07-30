require "application_system_test_case"

class TweetsTest < ApplicationSystemTestCase
  setup do
    @tweet = tweets(:one)
  end

  test "visiting the index" do
    visit tweets_url
    assert_selector "h1", text: "Tweets"
  end

  test "should create tweet" do
    visit tweets_url
    click_on "New tweet"

    fill_in "Body", with: @tweet.body
    fill_in "Name", with: @tweet.name
    click_on "Create Tweet"

    assert_text "Tweet was successfully created"
    click_on "Back"
  end

  test "should update Tweet" do
    visit tweet_url(@tweet)
    click_on "Edit this tweet", match: :first

    fill_in "Body", with: @tweet.body
    fill_in "Name", with: @tweet.name
    click_on "Update Tweet"

    assert_text "Tweet was successfully updated"
    click_on "Back"
  end

  test "should destroy Tweet" do
    visit tweet_url(@tweet)
    click_on "Destroy this tweet", match: :first

    assert_text "Tweet was successfully destroyed"
  end
end

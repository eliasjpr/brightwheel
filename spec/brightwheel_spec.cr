require "./spec_helper"
require "halite"

describe "POST /email" do
  describe "valid request" do
    payload = {
      "to":        "susan@abcpreschool.org",
      "to_name":   "Miss Susan",
      "from":      "noreply@mybrightwheel.com",
      "from_name": "brightwheel",
      "subject":   "Your Weekly Report",
      "body":      "<h1>Weekly Report</h1><p>You saved 10 hours this week!</p>",
    }

    it "works" do
      resp = Halite.post(ENDPOINT, json: payload)
      resp.status_message.should eq("OK")
    end
  end

  describe "invalid email" do
    payload = {
      "to":        "bad_email",
      "to_name":   "Miss Susan",
      "from":      "noreply@mybrightwheel.com",
      "from_name": "brightwheel",
      "subject":   "Your Weekly Report",
      "body":      "<h1>Weekly Report</h1><p>You saved 10 hours this week!</p>",
    }

    it "works" do
      resp = Halite.post(ENDPOINT, json: payload)
      resp.status_message.should eq("Bad Request")
    end
  end
end

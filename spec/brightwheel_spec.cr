require "./spec_helper"

describe Brightwheel do
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
    puts resp
  end
end

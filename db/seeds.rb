# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# POPULATES DATABASE WITH DEFAULT CARDS
url = 'https://tarot.howlcode.com/'
response = RestClient.get(url)
tarot_data = JSON.parse(response)

def convert_hash(obj)
    Hash[name: obj["name"], meaning: obj["short_meaning"], image_url: obj["face_image_url"], reverse: obj["reverse"], up: obj["up"], full_meaning: obj["full_meaning"]]
end

tarot_data.each { |card| Card.create(convert_hash(card))}
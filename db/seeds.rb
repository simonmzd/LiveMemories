# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.destroy_all
Concert.destroy_all


mel = User.create(email: "melanie.lepage86@hotmail.fr", password: "livememories", username: "mel")
simon = User.create(email: "mazaudsimon@gmail.com", password: "livememories", username: "simon")
quentin = User.create(email: "sainton.quentin86@gmail.com", password: "livememories", username: "quentin")
vincent = User.create(email: "vincent.testard2003@gmail.com", password: "livememories", username: "vincent")


concert_1 = Concert.create(
  title: "Coldplay - A Head Full of Dreams Tour",
  description: "Un show spectaculaire avec des effets lumineux incroyables et une ambiance euphorique.",
  genre: "Rock alternatif / Pop",
  date: Date.new(2017, 7, 15),
  localisation: "Paris, France",
  public: 75_000,
  venue: "Stade de France",
  user: mel
)

concert_2 = Concert.create(
  title: "Beyoncé - The Formation World Tour",
  description: "Une performance visuellement époustouflante, avec un show millimétré et des messages engagés.",
  genre: "R&B / Pop",
  date: Date.new(2016, 7, 2),
  localisation: "Londres, Royaume-Uni",
  public: 90_000,
  venue: "Wembley Stadium",
  user: simon
)

concert_3 = Concert.create(
  title: "Daft Punk - Alive 2007",
  description: "Un set électro mythique avec une scénographie futuriste et un son révolutionnaire.",
  genre: "Électro / House",
  date: Date.new(2007, 6, 14),
  localisation: "Paris, France",
  public: 17_000,
  venue: "Accor Arena",
  user: quentin
)

concert_4 = Concert.create(
  title: "Ed Sheeran - ÷ (Divide) Tour",
  description: "Un concert intimiste malgré l’immensité du public, seul avec sa guitare et sa loop station.",
  genre: "Pop / Folk",
  date: Date.new(2018, 8, 16),
  localisation: "East Rutherford, États-Unis",
  public: 82_000,
  venue: "MetLife Stadium",
  user: vincent
)
concert_5 = Concert.create(
  title: "Metallica - WorldWired Tour",
  description: "Un show puissant avec des solos de guitare légendaires et une énergie brute sur scène.",
  genre: "Metal / Rock",
  date: Date.new(2019, 6, 20),
  localisation: "Berlin, Allemagne",
  public: 70_000,
  venue: "Olympiastadion",
  user: simon
)

file = File.open(File.join(Rails.root, 'app/assets/images/Coldplay.jpg'))
concert_1.image.attach(io: file, filename: "nes.png", content_type: "image/png")
concert_1.save
puts "concert_1 saved"

file = File.open(File.join(Rails.root, 'app/assets/images/Beyoncé.jpg'))
concert_2.image.attach(io: file, filename: "nes.png", content_type: "image/png")
concert_2.save
puts "concert_2 saved"

file = File.open(File.join(Rails.root, 'app/assets/images/DaftPunk.jpg'))
concert_3.image.attach(io: file, filename: "nes.png", content_type: "image/png")
concert_3.save
puts "concert_3 saved"

file = File.open(File.join(Rails.root, 'app/assets/images/EdSheeran.jpeg'))
concert_4.image.attach(io: file, filename: "nes.png", content_type: "image/png")
concert_4.save
puts "concert_4 saved"

file = File.open(File.join(Rails.root, 'app/assets/images/Metallica.jpeg'))
concert_5.image.attach(io: file, filename: "nes.png", content_type: "image/png")
concert_5.save
puts "concert_5 saved"

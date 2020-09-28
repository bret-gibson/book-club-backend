require 'faker'
require 'rest-client'
require 'json'

User.delete_all
Group.delete_all
Book.delete_all
GroupBook.delete_all
GroupUser.delete_all
Post.delete_all

api_key = ENV["GOOGLE_BOOKS_API_KEY"]

# "Wuthering Heights"
# "Jane Eyre",
#     "Pride and Prejudice",
# "Fankenstein",
# "The Catcher in the Rye"
book_list= [
  
    "1984",
    "Against the Day",
    "Bleeding Edge",
    "Inherant Vice",
    "Vineland",
    # "Dracula",
    # "Anna Karenina",    
    "Crime and Punishment",
    "Lord of the Flies",
    # "A Tale of Two Cities",
    "East of Eden",
    "Catch-22",
    # "Don Quixote",
    "The Iliad",
    # "War and Peace",
    "Brave New World",
    # "The Picture of Dorian Gray",
    "The Brothers Karamazov",
    "The Sound and the Fury",
    "The Odyssey",
    "Fahrenheit 451",
    "The Metamorphosis",
    "Ulysses",
    # "The Three Musketeers",
    # "Oliver Twist",


   # "Slaughterhouse-Five",


    # "Gulliver's Travels",
    # "A Clockwork Orange",
    "The Kite Runner",
    # "Flowers for Algernon",
    "A Farewell to Arms",
    "The Canterbury Tales",
    # "Inferno",
    # "As I Lay Dying",
    # "Candide",
    "The Stranger camus",
    "Dune",
    "The Republic plato",
    "Blood Meridian",
    "The Road",
    # "Paradise Lost",
    "White Noise",
    "The Crying of Lot 49",
    "Absalom, Absalom!",
    # "The Jungle",
    "American Gods",
    "Breakfast of Champions",
    # "Aesop's Fables",
    "The Crucible",
    "Gravity's Rainbow",
    "Neuromancer",
    # "The Scarlet Letter",
    "Heart of Darkness",
    "Of Mice and Men",
    # "Robinson Crusoe",
    "On the Road"]

test_user = User.create!(
     username:"bret",
     password: "password",
     avatar: Faker::Avatar.image
    )

10.times do 
    User.create!(
         username: Faker::Twitter.screen_name,
         password: "p",
         avatar: Faker::Avatar.image
        )
end

10.times do 
    Group.create!(
        name: Faker::Superhero.name,
        description: Faker::Hipster.sentence(word_count: 10),
        image_url: Faker::LoremFlickr.image(size: "300x300", search_terms: ['book', 'reading'], match_all: true),
        public: Faker::Boolean.boolean(true_ratio: 0.7),
        admin_user_id: rand(1..10)
    )
end

20.times do
    user= User.all.sample().id
    group = Group.all.sample().id
    GroupUser.create!(
        user_id: user,
        group_id: group
    )
end


# 30.times do
#     image = Faker::LoremFlickr.image(search_terms: ['books'])
#     Book.create!(
#         title: Faker::Book.title,
#         author: Faker::Book.author,
#         summary: Faker::Hipster.paragraph,
#         pages: rand(93..1003),
#         average_rating: rand(1..5),
#         isbn13: rand(1000000000000..9999999999999),
#         isbn10: rand(1000000000000..9999999999999),
#         thumbnail: image
#     )
# end

book_list.each do |book|
    title_search = book
    url = "https://www.googleapis.com/books/v1/volumes?q=#{title_search}&key=#{api_key}"
    response = RestClient.get(url)
    json = JSON.parse(response)
    book_data = json["items"][0]
    image = Faker::LoremFlickr.image(search_terms: ['books'])


    # title: book_data["volumeInfo"]["title"],
    # author: book_data["volumeInfo"]["authors"][0],
    # summary: book_data["volumeInfo"]["description"],
    # pages: book_data["volumeInfo"]["pageCount"],
    # average_rating: book_data["volumeInfo"]["averageRating"],
    # isbn13: book_data["volumeInfo"]["industryIdentifiers"][0]["identifier"],
    # isbn10: book_data["volumeInfo"]["industryIdentifiers"][1]["identifier"],
    # thumbnail: book_data["volumeInfo"]["imageLinks"]["thumbnail"]



    Book.create!(
        title: book_data["volumeInfo"]["title"],
        author: book_data["volumeInfo"]["authors"][0],
        summary: book_data["volumeInfo"]["description"],
        pages: book_data["volumeInfo"]["pageCount"],
        average_rating: book_data["volumeInfo"]["averageRating"],

        isbn13: book_data["volumeInfo"]["industryIdentifiers"][0]["identifier"],
        isbn10: book_data["volumeInfo"]["industryIdentifiers"][1]["identifier"],

        thumbnail: book_data["volumeInfo"]["imageLinks"]["thumbnail"]
    )
end

15.times do
    group= Group.all.sample().id
    book = Book.all.sample().id
    GroupBook.create!(
        group_id: group,
        book_id: book,
        active: Faker::Boolean.boolean(true_ratio: 0.1),
        status: Faker::Hipster.sentence(word_count: 8)
    )
end

100.times do 
    user= User.all.sample().id
    group_book = GroupBook.all.sample().id
    Post.create(
        user_id: user,
        group_book_id: group_book,
        content: Faker::Hipster.sentence(word_count: 8),
        parent_id: nil
    )
end
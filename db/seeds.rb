# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

easy = Game.create(image: 'waldo-easy.jpg', dificulty: 'easy')
waldo = Character.create(name: 'waldo', game_id: 1, x0: 652, x1: 673, y0: 860, y1: 802, image: 'char_waldo.jpg')
wenda = Character.create(name: 'wenda', game_id: 1, x0: 662, x1: 681, y0: 694, y1: 663, image: 'char_wenda.jpg')
wizard = Character.create(name: 'wizard', game_id: 1, x0: 979, x1: 996, y0: 859, y1: 833, image: 'char_wizard.jpeg')
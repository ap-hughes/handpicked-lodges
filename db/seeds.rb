# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'

super_control = ENV["SUPER_CONTROL"]
url = "http://api.supercontrol.co.uk/xml/filter3.asp?siteID=#{super_control}"

puts "Creating properties"

doc = Nokogiri::XML(open(url))
doc.root.xpath('property').each do |property|
  Property.create!(
    enabled: true,
    code: property.xpath('propertycode').text.to_i,
    name: property.xpath('propertyname').text,
    sleeps: property.xpath('sleeps').text.to_i,
    bedrooms: property.xpath('bedrooms_new').text.to_i,
    bathrooms: property.xpath('bathrooms_new').text.to_i,
    min_daily_price: '%.2f' % property.xpath('mindaily').text.to_d,
    headline: "A Room (or a few) With A View – relaxed Edwardian grandeur at Westcott",
    description: "Westcott was built in an elegant age when people really knew how to enjoy their leisure time and when holidays to the Highlands first became fashionable, thanks to Queen Victoria. This elegant Edwardian villa is set on a quiet street above the lovely Highland village of Kingussie. Although only 15 minutes by car from Aviemore, Kingussie is a busy village in its own right and is convenient for outdoor activities at Loch Insh and Laggan Forest.

    From Westcott it’s only a short walk to shops, cafes, pubs and restaurants, but you’ll enjoy privacy and tranquillity, tucked away in peaceful West Terrace, a row of similarly handsome stone villas. You will be surrounded on all sides by tall majestic pines, home to some bold red squirrels and garden birds who visit the feeders many times a day.

    There is a large front porch with all the space you need for all your group’s outdoor wear. Then off the entrance hall you’ll find the drawing room with its beautiful stone fireplace, and relaxing seating. Across the hall the games room is ready to host some friendly competition over the table tennis net – and the perfect place for teenagers and kids to have their own space whilst adults relax in the drawing room.

    The large dining area is open plan to the light and bright kitchen, which contains all the modern appliances you will need to feed and water up to six of you in style. Through the utility and laundry room with washer-dryer and drying pulley, you access the downstairs loo and shower room.

    Upstairs is the large master bedroom with an ensuite shower room, as well as a double and a twin room. There is also a large family bathroom with double size shower and bath. At the top of the staircase a perfect little nook has been created for those who love to read, with a chaise longue placed by the window, and its own little reading lamp. Of course reading is not obligatory – you may prefer to simply gaze out at the fabulous views across to the Cairngorms peaks of Creag nan Bodach and Creag Druim, watch the wildlife through binoculars or even enjoy a little nap!

    The house is filled with light and the large windows everywhere make the most of the wonderful views. Westcott has been recently updated and refurbished; its original grand Edwardian character and beautiful period features and details have been perfectly incorporated into its contemporary interior design, making it feel warm, light and extremely comfortable.

    Whether you’re looking for a base for your own grand tour of the Highlands, a lodge with great walking and cycle routes on your doorstep or somewhere to retire to after days of strenuous activities in the hills, Westcott is the perfect blend of modern comforts in an elegant and beautifully peaceful setting.",
    wood_stove: true,
    hot_tub: true,
    pet_friendly: true,
    sauna: true,
    features: ["Sleeps 6 with space for cots", "​Pet friendly", "1 x king room with ensuite", "​1 x double room", "1 x twin room", "Free sat with Netflix",
      "Built in wardrobes", "Wood-burning stove", "Panoramic views", "Fantastic location", "Games room with table tennis",
      "Family bathroom with bath", "​Drying room with shower room", "​Dishwasher", "​Washing machine", "​Free WIFI​", "​BBQ & outdoor dining area",
      "Storage for sports equipment", "Parking for 4 cars", "​Large garden"]
    )
end

puts "Finished creating properties"

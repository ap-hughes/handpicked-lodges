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

puts "Deleting properties"

Photo.destroy_all
Property.destroy_all

puts "Creating properties"

doc = Nokogiri::XML(open(url))
doc.root.xpath('property').each do |property|
  Property.create!(
    enabled: false,
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
    games_room: false,
    )
end

puts "Updating properties"


puts "Updating alltnacriche"

#Alltnacriche
Property.where(code: 489553).update(
  enabled: true,
  name: "Alltnacriche",
  headline: "Spacious and luxurious self-catered pet friendly country lodge with large outdoor hot tub",
  description: "Alltnacriche is one of our largest lodges, comfortably sleeping 10 and with a vast kitchen-dining area as well as two sitting rooms. Beautifully furnished and finished, but with a relaxed country feel, it is ideal for large groups of family or friends who want a private but convenient location. It has recently undergone extensive renovation, with luxury touches added - including its large outdoor hot tub, and cosy underfloor heating throughout. The interior has been designed to be elegant but contemporary; with Farrow and Ball colours and some striking, bespoke pieces of furniture, the whole house has a timeless feel.

The enormous eat-in kitchen will delight any keen cook with its large range cooker, wine fridge and a generous expanse of surfaces. Dinner is served at the large oak dining table with its views out over the gardens and meadows which stretch down to the River Dulnain. Whilst dinner is being prepared, the rest of the party can enjoy drinks in the sitting room, set through an archway from the kitchen. After dinner you can either relax here in front of the large wood-burning stove and the TV, or in the second sitting room at the back of the house with TV, DVD player and Playstation. And be sure to remind any accomplished pianist in your group to bring their sheet music, so you can all enjoy the piano which sits in the dining area.

In the warmer months you may prefer to eat outside on the decked outdoor kitchen and barbecue area, perfectly positioned to take advantage of the afternoon sun as well as the views down to the river.

Two of the five large bedrooms are on the ground floor. The master has a luxurious super-king bed, dressing room and ensuite shower room and the other has been fitted with a pair of handsome, bespoke, adult-sized bunk beds.  There are three further bedrooms upstairs; one with a double bed, one with a king bed and the other with twin beds which can be zip-linked to become a super-king bed on request. Upstairs you will also find both the bathroom and shower room.

Should you have any work to do whilst at Alltnacriche, there is a spacious, private home office with free unlimited WIFI. Whatever the season and whatever Highland adventures you return from, there is room for everyone’s outdoor clothes and equipment both in the outdoor bike store and in one of the largest and most well-equipped utility-cum-boot room we have ever seen!

The ground floor is fully accessible for wheelchair users and the bedroom is fully equipped for a less mobile guest if required. It has an ensuite wet room, sitting shower and large jacuzzi bath. *

Your four legged family members have their own room too in the \"dog house\", a delightful under-stairs bolt hole in the kitchen where even the largest hound can stretch out in comfort and peace.​

Alltnacriche is perfect for children, with a very safe position away from the road and a large grassy garden for playing. The river makes a perfect place for older kids to play, or for a 10 minute riverside stroll to the centre of historic Carrbridge. The village is home to cafes, pubs and outdoor fun at the perennial family favourite, Landmark Forest Adventure park. Carrbridge Golf course is also located just 500m from Alltnacriche.

Alltnacriche is in a family orientated location with the owners living next door and some lovely neighbours nearby. If you are booking for a large group of friends, please contact us prior to booking and we can advise on suitability.


*super ​king bedroom can be made up as a twin upon request.
*Disabled access room available on request.",
  wood_stove: true,
  hot_tub: true,
  pet_friendly: true,
  sauna: false,
  in_aviemore: false,
  in_country: true,
  we_love: "The cosy country house vibe, with that huge social kitchen diner.....and of course the piano!",
  guests_love: "In the Scottish highlands this place is without a doubt the place to book.",
  latitude: 57.284756,
  longitude: -3.827582,
  meta_title: "Alltnacriche - Country lodge with hot tub",
  meta_description: "Luxury self catering pet friendly country house with hot tub sleeping 10 in the Cairngorms National Park"
  )

alltnacriche = Property.where(code: 489553)

features = ["1x super king bedroom with ensuite", "​1x super king bedroom (or twin)*", "​1x king bedroom", "1x double bedroom", "1 x bunk room",
  "1 x disabled access room*", "​Space for infant cots", "Fully DDA compliant*​", "​Pet friendly​", "​Under-floor heating", "Indoor dog house",
  "​Home office", "​​Wood-burning stove", "Second living room", "Extensive DVD collection", "​Play station", "2 x large TV's", "Range cooker",
  "Coffee machine", "BBQ", "​Hot tub", "​Patio and garden", "Dishwasher", "Free WIFI", "​Utility room", "Washing machine", "Off-street parking", "​River view​",
  "​Storage for sports equipment"]

puts "Creating features for Alltnacriche"

features.each do |feature|
  Feature.create!(name: feature, key:false, property_id: alltnacriche[0][:id])
end
# puts "doing alltnacriche's photos"

# [File.expand_path("~/Desktop/PBC/images/All Cabins 2018/Braeriach compressed/Braeriach/1Q7A4095-1-2.jpg"),
#   File.expand_path("~/Desktop/PBC/images/All Cabins 2018/Braeriach compressed/Braeriach/1Q7A4122-1.jpg")].each do |link|
#     alltnacriche.photo.create(remote_image_url: link)
# end
# alltnacriche.photos = [
#   Pathname.new(File.expand_path("~/Desktop/PBC/images/All Cabins 2018/Braeriach compressed/Braeriach/1Q7A4095-1-2.jpg")).open,
#   Pathname.new(File.expand_path("~/Desktop/PBC/images/All Cabins 2018/Braeriach compressed/Braeriach/1Q7A4122-1.jpg")).open
# ]

# alltnacriche.save!

# puts "done alltnacriche's photos"

#Burnbrae Lodge

puts "Updating Burnbrae lodge"

#Alltnacriche
burnbrae = Property.where(code: 492277).update(
  enabled: true,
  name: "Burnbrae Lodge",
  headline: "A spacious self-catered lodge with panoramic views of the Cairngorms and River Dulnain",
  description: "Contemporary, light and spacious with stunning panoramic views, Burnbrae is a great family-friendly detached house situated in the attractive and historic village of Carrbridge, in the heart of the Cairngorms National Park.

The lodge sits at the end of a quiet cul-de-sac, in a small cluster of luxury homes. Although the village centre is on your doorstep, views of the River Dulnain, Cairngorm Mountain or Carrbridge golf course from every window give the lodge a truly rural feeling. This large house comfortably accommodates eight and is ideal for children large and small. The furniture, fittings and finishes are of a high standard with luxury features such as underfloor heating, a wood-burning stove and a sauna.

Everyone can relax and soak up the wonderful views from the light-filled and comfortable living room with its cosy wood burner, whilst the separate dining room is perfect for more formal dining or for celebrating a special occasion. The sociable open plan kitchen-diner is equipped with breakfast bar, induction hob and a large wine fridge. It opens onto a deck from where you can enjoy those beautiful, uninterrupted views towards the mountains, whilst enjoying drinks, meals or a barbecue in the summer months. The well-equipped games room will keep the big kids entertained for hours, with pool, darts and table football, not to mention the extensive DVD collection! Meanwhile the additional snug room is perfect for children to play in or for older kids to have their own space with a third TV and sofa. You may prefer to retreat for some relaxation and tranquility in the sauna, accessed from the snug.
​
Upstairs the Master bedroom has a king-sized bed and contemporary ensuite shower room with double sink and walk in rain shower. There is also a double bedroom with ensuite shower room, a twin bedroom and a fourth bedroom with two sets of adult-sized bunk beds. Upstairs you’ll also find the luxurious family bathroom with its large statement bath, and there is a further shower room on the ground floor.

If you need to keep in touch with anyone while you’re away, you can make use of the free unlimited WIFI. There is plenty of storage for coats, equipment and outdoor clothes in the utility room, whilst the enormous entrance hall is perfect for everyone to get geared up for their adventures, and for removing wet, sandy, muddy or snowy kit after a fun-packed day in the Cairngorms!",
  wood_stove: true,
  hot_tub: false,
  pet_friendly: true,
  sauna: true,
  games_room: true,
  in_aviemore: false,
  in_country: true,
  we_love: "This lodge just goes on and on! A huge games room, a snug upstairs with its own sauna, and a simply enormous entrance hall perfect for Cairngorms outdoor life.",
  guests_love: "Incredible scenery!",
  latitude: 57.285706,
  longitude: -3.809133,
  meta_title: "Burnbrae Lodge - Large lodge with Sauna",
  meta_description: "Self-catering pet friendly luxury accommodation sleeping 8 with wood burning stove and sauna"
  )

features = ["Sleeps 8 with space for cots", "1x king room with ensuite", "1x double room with ensuite", "1x twin room", "1x bunk room",
  "Built in wardrobes", "Large family bathroom", "BBQ", "Sauna", "Second TV room", "​Wood-burning stove", "​Pet friendly", "​Under-floor heating",
  "​Ground source heat pump", "Dining room", "Games room - darts, pool etc", "Extensive DVD collection", "​Dishwasher", "​Wine fridge",
  "​Washing machine", "Free WIFI", "Induction hob", "​Coffee Machine", "Utility room", "Deck and garden", "​River and mountain views",
  "​Storage for sports equipment", "Off-street parking"]

puts "Creating features for Burnbrae Lodge"

features.each do |feature|
  Feature.create!(name: feature, key:false, property_id: burnbrae[0][:id])
end

puts "Updating Cairn Eilrig"

#Cairn Eilrig
cairn = Property.where(code: 529819).update(
  enabled: true,
  name: "Cairn Eilrig",
  headline: "A pet friendly lodge perfect for outdoor enthusiasts, with the most breathtaking mountain views.",
  description: "All our Handpicked lodges have pretty special views, but those from Cairn Eilrig are in a class of their own. Only a tiny handful of holiday properties lie at the mountain end of the ski road and even fewer enjoy quite such a spectacular Cairngorms panorama. Particularly beautiful covered in winter white or late summer’s heathery purple, the mountains look almost close enough to touch. From CairnGorm itself and the northern corries, the panoramic view sweeps across to the forests above Loch Morlich, and to the distinctively-shaped hill from which the house takes its name.

This peaceful spot is close to all the natural and sporting attractions in our part of the National Park. Loch Morlich beach and watersports can be reached on foot in only 10 minutes. You have immediate access to the walking and biking trails throughout Glenmore Forest, and the ski area is only 5 minutes drive. The lodge in fact sits proudly on the much loved Mealle a’ Bhuachaille circuit walk or for a slightly shorter walk for all abilities and ages, the wonderful  trail to the Lochan Uaine is enchanting (it translates as green lochan - it is said that mischieveous fairies wash their clothes there which is why the water is green!)

Despite Cairn Eilrig’s incredible location, there has been no compromise on luxury and comfort. The house has been recently redecorated to a high standard in a warm, contemporary style. The large and modern kitchen-diner seats 6 and leads round to the lounge area with its cosy wood burner and magnificent mountain views. The sun room is the perfect place to sit and enjoy a coffee and plan your day of Cairngorms adventures or enjoy a dram in the evening while watching the sun set. The twin and king bedrooms enjoy mountain views whilst the master looks out to the forest. There is a smart bathroom and master ensuite shower room.

The large bootroom-cum-utility room is ideal for drying your clothes and footwear after a day in the hills, on the beach or the slopes, and has a washing machine and dryer. There’s a secure outdoor store for your bikes and an outdoor tap to wash them down after your ride.

In the warmer months you can immerse yourself in the views all around you from the benches in the garden and watch the birds and red squirrels visit. Cairn Eilrig is Gaelic for “Hill of the Deer Walk”. The lodge sits on the hill above the Cairngorm Reindeer Centre where the herd come down from the high grounds to stay for the winter. You will regularly catch sight of some of your inquisitive neighbours between October and Christmas when they train with the sleighs on the road below the house - it's  a magical sight for little ones and big ones alike.

There are two lovely little cafes within a few minutes walk (Cobbs at Glenmore Visitor Centre and the Red Squirrel Cafe), and if you fancy a break from cooking dinner, there is a fully licensed restaurant and bar at Glenmore Lodge. Aviemore is only 10 minutes drive away with shops, bars, cafes and restaurants, cinema and swimming pool. Many of its pubs and bars host live music in the evenings and you’ll find most of them are dog friendly.

Cairn Eilrig really is the perfect Cairngorms holiday lodge for those who love to be surrounded by nature, mountain landscapes and the best of the Highland outdoor lifestyle, and is a rare opportunity to stay in such a beautiful, one-of-a-kind location.",
  wood_stove: true,
  hot_tub: false,
  pet_friendly: true,
  sauna: false,
  in_aviemore: false,
  in_country: true,
  we_love: "A truly amazing location - you're only minutes away from CairnGorm and Loch Morlich - and the mountains look close enough to touch!",
  guests_love: "Fantastic cottage, with amazing views",
  latitude: 57.167438,
  longitude: -3.690322,
  meta_title: "Cairn Eilrig - Luxury dog friendly holiday lodge",
  meta_description: "Book now to stay in the only holiday home at the foot of Cairngorm Mountain"
  )

features = ["Sleeps 6 with space for cots", "​Pet friendly", "1x king room with ensuite", "1x king room", "1x twin room",
  "Sky TV", "Built in wardrobes", "Wood-burning stove", "Panoramic views", "Fantastic location", "Sun room", "Family bathroom with bath",
  "​Drying room", "​Dishwasher", "​Washing machine", "​Free WIFI​", "BBQ & outdoor dining area", "Storage for sports equipment",
  "Parking for 4 cars", "​Large garden"]

puts "Creating features for Cairn Eilrig"

features.each do |feature|
  Feature.create!(name: feature, key:false, property_id: cairn[0][:id])
end

puts "Updating Foresters Lodge"

#Foresters Lodge
foresters = Property.where(code: 488258).update(
  enabled: true,
  name: "Foresters Lodge",
  headline: "Stylish and atmospheric pet friendly highland lodge, with hot tub and sauna cabin in the Cairngorms National Park.",
  description: "Foresters Lodge offers a luxurious retreat in a simply stunning riverside setting in the heart of the Cairngorms National Park.

In 2017 this exquisite 19th century stone lodge underwent extensive refurbishment. Many luxury, locally-crafted and completely bespoke features were incorporated, all of which combine to turn a relaxed self-catering Highland break into a really special and memorable stay.

The carefully chosen furniture and finishes in each room create a warm, calming and contemporary feel throughout the whole house. The stylish kitchen diner has been lovingly refurbished in a contemporary-rustic style, with a large and welcoming farmhouse table and wide butler’s sink. From the kitchen you can step out of the patio doors to the outdoor eating area with a Weber BBQ and seating for 10. After a day of Cairngorms adventures you can choose to relax in the large family room with its open fire, or the cosy snug room with its wood-burning stove. However during an evening at Foresters it’s also hard to resist the pull of the atmospheric, panelled games room with a pool table, darts board and bar.

When it’s finally time to turn in, there are four large bedrooms to choose from. Three have king-sized beds, and one has its own en-suite shower room. The fourth bedroom has three single beds plus a handy pull out bed. There is also a family bathroom with a handsome roll-top bathtub.
​
Outside, wooden steps lead down to an attractive decked area where you will find the beautiful authentic Canadian cedar wood hot tub. Whilst relaxing here you can take in the stunning views down the River Nethy which meanders along the bottom of the large, lawned garden, and even catch glimpses of the mountains beyond. After a spell in the hot tub you can then head to the wonderful contemporary Finnish sauna to complete your relaxing spa experience. The sauna and spa area, with an invigorating rain shower and a heated floor, are housed in a bespoke building next door to the lodge.

The lodge is perfectly located to benefit from the tranquility of the riverbank, the proximity of Nethy Bridge, Carrbridge, Grantown and Aviemore, and the great outdoor playground that is the Cairngorms National Park.

Foresters Lodge is a child and dog friendly lodge, with all of the grounds fenced in and with access to the river bank also restricted for safety.

It is in a family orientated location with some lovely neighbours nearby.

If you are booking for a large group of friends, please contact us prior to booking and we can advise on suitability.

* 10th bed is a pull out bed",
  wood_stove: true,
  hot_tub: true,
  pet_friendly: true,
  sauna: true,
  games_room: true,
  in_aviemore: false,
  in_country: true,
  we_love: "The spa area – such a decadent treat after a day in the hills!",
  guests_love: "We made great use of the sauna, hot tub and games room each evening, without ever feeling the need to leave the lodge!",
  latitude: 57.259791,
  longitude: -3.640563,
  meta_title: "Foresters Lodge - Country lodge with hot tub and sauna",
  meta_description: "Luxury dog friendly holiday lodge with hottub and sauna in the Cairngorms National Park"
  )

features = ["1x king bedroom with ensuite", "2x king bedrooms", "1x triple/quad room*", "Roll top bath", "Off-street parking", "​Wood-burning stove",
    "Open Fire", "​Pet friendly", "2x large TV's", "Bluetooth stereo", "Games room - Pool/bar/darts", "DVDs and games", "​Hot tub",
    "​Spa with sauna and rain shower", "Under-floor heating in spa", "Games room - bar, darts, pool", "​​Range cooker", "Butlers sink",
    "​Dishwasher", "Coffee Machine", "Free WIFI​", "​Washing machine", "​Weber BBQ", "River views", "Deck", "​Patio", "Enclosed garden", "Storage for sports equipment"]

puts "Creating features for Foresters Lodge"

features.each do |feature|
  Feature.create!(name: feature, key:false, property_id: foresters[0][:id])
end

puts "Updating Riverside Lodge"

#Riverside Lodge
riverside = Property.where(code: 490651).update(
  enabled: true,
  name: "Riverside Lodge",
  headline: "Light, bright and modern, architecturally designed, pet and family friendly with breathtaking views.",
  description: "This architecturally designed luxury lodge was recently built on an elevated site on the banks of the River Nethy, just a short walk from the picturesque village of Nethy Bridge. All on one level, it was designed to take full advantage of its position, with views along the river and across to the mature pines beyond.

No expense has been spared on the fittings and finishes in this lodge, from the beautiful granite work tops and huge range oven, to the wood-burning stove and striking antler chandeliers hung between exposed oak beams. Extra luxury features such as real wood floors with underfloor heating mean that this lodge offers the very finest in relaxed holiday living.

The heart of the lodge is its huge open plan kitchen and living area, perfect for gatherings of family or friends. This impressive, double height room feels even more light and spacious thanks to its panoramic 7 metre window wall, opening onto the outdoor dining and barbecue area. Past the large oak dining table, the room extends down to where the comfortable sofas are arranged around the cosy wood burning stove, with a large screen TV with Netflix*and a playstation.

All three south-facing bedrooms have sliding patio doors, designed for enjoying the glorious river view and allowing you to step out onto the patio and garden beyond.* The king and twin bedrooms share the large luxury family shower room with an indulgent rain shower and a skylight which fills the room with natural light. The large master bedroom has its own en suite shower room and a wall mounted TV, in the unlikely event that you ever tire of the wonderful view!

The garden stretches down to the peaceful river bank, perfect for bird and nature watching, some informal fishing, or simply some quiet moments of reflection and relaxation. There is a fire pit close to the riverbank, ideal for gathering around on cool Highland summer nights.

After a day out exploring this fantastic part of the Cairngorms National Park, you may well need to make good use of the lodge’s large laundry and utility room! Its washing machine and drying wall will make short work of any rain, mud or snow that your outdoor clothing may have encountered during your adventures.

Nethy Bridge has some lovely local amenities and is close to some award-winning restaurants, cafes and bars. Located in one of the most popular parts of the Cairngorms and just a stones throw from Aviemore, your choice of activities are endless. Everything from bird watching to white water rafting is here, ready for you to discover!

*Please bring own login details
*Child locks can be used if required.",
  wood_stove: true,
  hot_tub: false,
  pet_friendly: true,
  sauna: false,
  in_aviemore: false,
  in_country: true,
  we_love: "An evening spent by the fire pit next to the river – plus the antler chandeliers!",
  guests_love: "Opening the bedroom patio door to the sunshine and sound of the river every morning…Our small people guddled in the river for hours on end.",
  latitude: 57.263195,
  longitude: -3.640658,
  meta_title: "Riverside Lodge - Modern luxuries with river views and wood burner",
  meta_description: "Stunning luxury holiday home in the Cairngorms National Park, pet friendly with amazing views"
  )

features = ["Pet friendly", "1x king bedroom with ensuite", "1x double bedroom", "​1x twin bedroom", "Space for infant cot",
  "​Large family shower room", "​Wood-burning stove", "TV in master bedroom", "Netflix* and playstation", "Bluetooth speakers",
  "Under-floor heating", "Air source heat pump", "​​Dishwasher", "​Range cooker", "Coffee Machine", "Utility room", "​Washing machine​",
  "​Free WIFI", "Off-street parking", "​BBQ", "​Fire Pit", "​Patio and garden", "​River views throughout", "Storage for sports equipment​​"]

puts "Creating features for Riverside Lodge"

features.each do |feature|
  Feature.create!(name: feature, key:false, property_id: riverside[0][:id])
end

puts "Updating Smithy & Riverside Lodge"

#Smithy & Riverside Lodge
Property.where(code: 490734).update(
  enabled: true,
  name: "Smithy & Riverside Lodge",
  headline: "For larger gatherings why not book these two stunning neighbouring properties together?",
  description: "For larger gatherings the Old Smithy and Riverside Lodge can be booked together, making them ideal for extended families or two families holidaying together. They are located next door to each other with a small gate leading between the two gardens. The large open plan living area in Riverside Lodge is the perfect space for all guests from both properties to enjoy with a large table which comfortably seats 12 people. There is also a lovely patio area with barbecue which is great fun for large gatherings.

The Smithy has a master bedroom with a king size bed, a double bedroom and a further two single beds in the attic. Riverside Lodge also has a master bedroom with a king bed, another bedroom with king bed and a twin bedroom.

The Smithy and Riverside Lodge are located next door to each other in an elevated position on the banks of the River Nethy with beautiful enclosed, lawned adjoining gardens perfect for children and dogs. Wooden steps lead you down to a peaceful seating area on the river bank to enjoy some summer evening relaxation or informal fishing, bird and nature watching. There is also a fire pit and a barbecue for you to enjoy.

Find out more about each of the lodges on the Smithy and Riverside Lodge pages.",
  wood_stove: true,
  hot_tub: false,
  pet_friendly: true,
  sauna: false,
  in_aviemore: false,
  in_country: true,
  we_love: "The huge open plan area makes for the perfect place for a special get together",
  guests_love: "The house is ideal for families or groups of friends and it couldn't be better equipped for what we needed",
  latitude: 57.263195,
  longitude: -3.640658,
  meta_title: "Smithy & Riverside Lodge - Traditional and modern perfect for family gatherings",
  meta_description: "Large holiday home near Aviemore with stunning views perfect for family holidays"
  )

puts "Updating The Bothy"

#The Bothy
bothy = Property.where(code: 493259).update(
  enabled: true,
  name: "The Bothy",
  headline: "Cool Scandi-style interiors filled with cosy home comforts perfect for families and dogs in the centre of Aviemore",
  description: "The Bothy was beautifully redesigned and refurbished during 2017 to create an elegant and peaceful haven from all the activity of Aviemore. It is located on a quiet cul-de-sac surrounded by family homes in the residential part of the town, only a short walk to the centre.

Inside, this lovely little lodge combines an appealing blend of modern Scottish and cool Scandinavian-style interiors with cosy home comforts.

The Bothy living room is a great relaxation space large enough for kids and dogs to spread out in. After an active day you can comfortably spend a whole evening here, curled up on its large leather sofas in front of the Morso wood-burning stove – maybe indulging in some Netflix movies – or with a dram or two if you prefer!
​
Off the entrance hall are two spacious bedrooms, a twin and a double with built-in wardrobes and huge inviting beds, both finished in clean, neutral colours and luxurious fabrics for a feeling of calm and relaxation. So too the lavish neo-Victorian style bathroom with its large walk in shower, beautiful mosaic tiles and a deep roll top bath to sink into.

At the end of the hall is the large modern kitchen. Next door the dining room perfectly balances Scandinavian minimalism with the odd dash of Scottish whimsy, providing the perfect space for romantic dinners or family meals. Outside, its enclosed garden makes The Bothy perfect for both children and dogs.

Aviemore really is the buzzing centre of the Cairngorms natural outdoor playground, with shops, bars, cafes and restaurants all within easy walking distance of the Bothy. Aviemore famously sports many big name outdoor shops and brands, from budget options to high end clothing and equipment, and the knowledge and expertise to go with it. Many of its pubs and bars host live music in the evenings, both during the week and the weekend, from local, traditional Scottish folk and ceilidh bands, to eclectic musicians from all over the globe.

The Bothy is perfectly located to make the most of all this fantastic area has to offer, whether on foot, by bike or car. There are moderate hillwalks easily accessible from the town centre and The Bothy, such as the route to the summit of Craigellachie. Rothiemurchus Estate is accessible from Aviemore centre on foot or bike via wide paths and tracks, or a few minutes away by car. Here you will find the enchanting Loch an Eilein and an endless number of family friendly walks and cycle routes. Venture 10 minutes further up the ski road by car to reach Cairngorm Mountain itself where skiing, climbing and mountain walking await to challenge even the most seasoned adventurer.

For those who prefer their sports at a lower altitude, the Spey Valley Championship Golf Course is a short walk from The Bothy. Alternatively there are 5 other courses in the area to try. Route 7 cycle route also runs right past the door, suitable in this local section for all ages and abilities of cyclist.",
  wood_stove: true,
  hot_tub: false,
  pet_friendly: true,
  sauna: false,
  in_aviemore: true,
  in_country: false,
  we_love: "We can’t choose between its cosy Morso wood burning stove and the huge roll top bath!",
  guests_love: "a fabulous place to stay...can you come and design my house?",
  latitude: 57.202522,
  longitude: -3.825623,
  meta_title: "The Bothy - Luxury self-catering in the centre of Aviemore",
  meta_description: "Cosy self catering retreat in the centre of Aviemore, dog friendly with wood burning stove"
  )

features = ["Sleeps 4 with space for a cot", "​Pet friendly", "1x double room", "1x twin room", "Located in a quiet cul-de-sac",
  "Bedroom TV's with Netflix", "Netflix & Now TV", "Built in wardrobes", "​​​Sonos speakers", "Wood-burning stove", "DVD's & board games​",
  "​Roll top bath", "​Walk in shower", "​Dishwasher", "​Washing machine", "​Free WIFI​", "​BBQ & outdoor dining area", "Storage for sports equipment",
  "Parking for 2 cars", "​Enclosed garden"]

puts "Creating features for The Bothy"

features.each do |feature|
  Feature.create!(name: feature, key:false, property_id: bothy[0][:id])
end

puts "Updating The Old Smithy"

#The Old Smithy
old_smithy = Property.where(code: 490650).update(
  enabled: true,
  name: "The Old Smithy",
  headline: "Cosy self-catered cottage full of character and history.",
  description: "When you spend a holiday in this beautiful cosy cottage, you’re staying in a little piece of history. Whilst some parts date back to 1806, the house was totally renovated in 2012 to provide a charming balance of modern living with uniquely beautiful period features. The Old Smithy is the old blacksmith’s cottage and you can still see the old ford across the river where the horses crossed from the farms beyond, and even the large stones in the lawned garden where the smith did his work.

This peaceful little cottage is located in an elevated position on the banks of the River Nethy. The south-facing cottage garden is home to a 150 year old oak tree and because it is enclosed, is perfect for children and dogs. From the garden some wooden steps lead you down to what is possibly the cottage’s most endearing feature – a bench set right on the river bank. Here you can enjoy some quiet evening reading with a dram or two, some informal fishing, bird and nature watching, or simply just take time to appreciate the relaxing sight and sound of this lovely Highland river flowing by.

Inside, the open plan living area looks out onto the garden and is arranged around the impressive original stone fireplace, which now houses a modern and efficient wood-burning stove.

In fact with underfloor heating in the two bathrooms, dishwasher, washing machine, WiFi and Playstation 3, this cosy cottage everywhere manages to retain its traditional character and period charm whilst providing every comfort and convenience that you would expect from a modern self catered holiday.

The large master bedroom has a king sized bed, TV and DVD player and en-suite shower room. There is a large family bathroom, and a pretty second double room overlooking the garden, with its own TV and DVD player. Up the wooden attic stairs is ‘the cabin;’ a perfectly snug hideaway for older kids with two comfy single beds, bean bags and twinkling fairy lights.

With its tranquil riverside setting, The Old Smithy is in the perfect location to enjoy a slower pace of life and to admire the local wildlife quite literally from your doorstep. But once you venture out, you will find yourself just a short walk from the beautiful village of Nethy Bridge, in one of the most famous and well-loved parts of the Cairngorms National Park with a multitude of activities and natural attractions to choose from.",
  wood_stove: true,
  hot_tub: false,
  pet_friendly: true,
  sauna: false,
  in_aviemore: false,
  in_country: true,
  we_love: "Sitting on the private riverside bench listening to the calming sound of the river whilst dragonflies buzz by.",
  guests_love: "A lovely cottage in a beautiful location. Private steps leading down to the river and the log burning stove which will keep you warm after a day walking in the forests or hills…Five stars.",
  latitude: 57.263148,
  longitude: -3.640315,
  meta_title: "The Old Smithy - Cosy retreat with river views and wood burner",
  meta_description: "Beautiful pet friendly self catering country cottage in the Highlands with wood burning stove and period features"
  )

features = ["Off-street parking", "​Pet friendly", "1x king bedroom with ensuite", "1x double bedroom", "1x twin in upstairs 'cabin'",
  "Space for a cot", "TV in both bedrooms", "​​Large family bathroom", "Playstation", "Bluetooth speaker", "Bathroom underfloor heating",
  "Original features", "​Wood-burning stove", "Dishwasher & washing machine", "​Free WIFI", "BBQ", "Patio and large enclosed garden", "​River view",
  "Storage for sports equipment", "River seat​"]

puts "Creating features for the Old Smithy"

features.each do |feature|
  Feature.create!(name: feature, key:false, property_id: old_smithy[0][:id])
end

puts "Updating Trails End Lodge"

#Trails End Lodge
trails_end = Property.where(code: 523669).update(
  enabled: true,
  name: "Trails End Lodge",
  headline: "Spacious, modern and luxurious self-catered lodge right on the fringes of the forest above Aviemore.",
  description: "A contemporary, smart and spacious lodge in Aviemore, perfect for outdoor enthusiasts and active families.

Trails End Lodge is located in High Burnside, a prestigious development of large family homes at the edge of an ancient Caledonian Pine forest, and which enjoys wonderful views across to the Cairngorms. It really is the perfect location for an Aviemore stay, with the village centre only a 15 minute walk away, but with almost immediate access to vast Kinveachy Forest. The forest contains an endless variety of natural mountain bike and running trails – from which this lodge takes its name.

The gate into the forest is only a couple of minutes walk from the front door. Turning south from the gate into the forest, you can head cross country for Craigellachie Nature Reserve and spot its Peregrine Falcons circling overhead. Heading north through the woods you can cycle to Carrbridge or Boat of Garten. Or if you are confident and experienced enough, perhaps you could try your luck on one of the infamous downhill mountain bike trails through the trees – such as “Trail to Nowhere” – rated as double black diamond - though be warned, these are not for the faint-hearted, or the beginner! The forest is also home to a wide variety of native Highland wildlife, including roe deer, red squirrels and capercaillie.

This lodge itself is the ideal blend of stylish and contemporary design with practical features and layout. The huge family kitchen has both a breakfast bar and a large table which easily seats 8. From the kitchen, patio doors lead out to the large lawned garden, perfect for family sports and games. In fact High Burnside is perfect for a family stay, with its own children’s play park and fenced sports area as well as safe and quiet residential roads, with the lodge itself located on a cul de sac.

The master bedroom has a super-king bed and large en-suite with a double shower. There is another bedroom with a double bed upstairs and also a king bedroom downstairs. There is a lovely, bright triple room with single bed, mid sleeper and truckle bed. All bedrooms have a double built in wardrobe, and the master has two. The family bathroom is on the first floor and there is also a downstairs loo off the entrance hall.  The lodge’s lounge is spacious with lots of natural light and a contemporary Morso wood burning stove, large TV with Free Sat and DVD player.

Trails End Lodge has plenty of storage for all your outdoor clothing and equipment, as well as a secure garage and carport which usefully incorporates the wood store. A washing machine and convenient drying area are located in the utility room leading from the kitchen to the back door.
​
Trails End Lodge is all about luxurious but relaxed comfort – the ideal place to unwind after a day of Cairngorms adventures.",
  wood_stove: true,
  hot_tub: false,
  pet_friendly: true,
  sauna: false,
  in_aviemore: true,
  in_country: false,
  we_love: "So much space! - a huge kitchen, big garden and loads of space for all your outdoor kit and clothing - if you're an outdoors family it ticks all the boxes.",
  guests_love: "Five star accommodation! Five star holiday! Five star location!",
  latitude: 57.203590,
  longitude: -3.837150,
  meta_title: "Trails End Lodge - Contemporary Smart and Spacious",
  meta_description: "Large modern family and pet friendly lodge on the edge of Aviemore in the heart of the Cairngorms"
  )

features = ["Sleeps 8 with space for cots", "1x super king room with ensuite", "1x double room", "1x triple kids room", "1x king room",
  "Built in wardrobes", "Large family bathroom", "​Wood-burning stove", "​Pet friendly", "Large kitchen diner", "​Coffee Machine", "Utility room",
  "​Dishwasher", "​Washing machine", "​Free WIFI", "Huge garden", "Access to Craigellachie Reserve", "​Mountain views", "​Storage for sports equipment",
  "​Off-street parking"]

puts "Creating features for Trails End Lodge"

features.each do |feature|
  Feature.create!(name: feature, key:false, property_id: trails_end[0][:id])
end

puts "Updating Westcott"

#Westcott
westcott = Property.where(code: 536256).update(
  enabled: true,
  name: "Westcott",
  headline: "A Room (or a few) With A View – relaxed Edwardian grandeur at Westcott",
  description: "Westcott was built in an elegant age when people really knew how to enjoy their leisure time and when holidays to the Highlands first became fashionable, thanks to Queen Victoria. This elegant Edwardian villa is set on a quiet street above the lovely Highland village of Kingussie. Although only 15 minutes by car from Aviemore, Kingussie is a busy village in its own right and is convenient for outdoor activities at Loch Insh and Laggan Forest.

From Westcott it’s only a short walk to shops, cafes, pubs and restaurants, but you’ll enjoy privacy and tranquillity, tucked away in peaceful West Terrace, a row of similarly handsome stone villas. You will be surrounded on all sides by tall majestic pines, home to some bold red squirrels and garden birds who visit the feeders many times a day.

There is a large front porch with all the space you need for all your group’s outdoor wear. Then off the entrance hall you’ll find the drawing room with its beautiful stone fireplace, and relaxing seating. Across the hall the games room is ready to host some friendly competition over the table tennis net – and the perfect place for teenagers and kids to have their own space whilst adults relax in the drawing room.

The large dining area is open plan to the light and bright kitchen, which contains all the modern appliances you will need to feed and water up to six of you in style. Through the utility and laundry room with washer-dryer and drying pulley, you access the downstairs loo and shower room.

Upstairs is the large master bedroom with an ensuite shower room, as well as a double and a twin room. There is also a large family bathroom with double size shower and bath. At the top of the staircase a perfect little nook has been created for those who love to read, with a chaise longue placed by the window, and its own little reading lamp. Of course reading is not obligatory – you may prefer to simply gaze out at the fabulous views across to the Cairngorms peaks of Creag nan Bodach and Creag Druim, watch the wildlife through binoculars or even enjoy a little nap!

The house is filled with light and the large windows everywhere make the most of the wonderful views. Westcott has been recently updated and refurbished; its original grand Edwardian character and beautiful period features and details have been perfectly incorporated into its contemporary interior design, making it feel warm, light and extremely comfortable.

Whether you’re looking for a base for your own grand tour of the Highlands, a lodge with great walking and cycle routes on your doorstep or somewhere to retire to after days of strenuous activities in the hills, Westcott is the perfect blend of modern comforts in an elegant and beautifully peaceful setting.",
  wood_stove: true,
  hot_tub: false,
  pet_friendly: true,
  sauna: false,
  games_room: true,
  in_aviemore: false,
  in_country: true,
  we_love: "Those cheeky red squirrels who love to put on a show right outside the windows. They have their own little playground created amongst the pines and you could sit watching them all day!",
  guests_love: "Wescott is absolutely beautiful. We loved seeing all of the wildlife in the garden.",
  latitude: 57.078880,
  longitude: -4.063800,
  meta_title: "Westcott - Impressive and newly renovated self-catering lodge",
  meta_description: "Impressive and spacious self-catering detached country house with games room period features and breathtaking views"
  )

features = ["Sleeps 6 with space for cots", "​Pet friendly", "1x king room with ensuite", "​1x double room", "1x twin room",
  "Free sat with Netflix", "Built in wardrobes", "Wood-burning stove", "Panoramic views", "Fantastic location",
  "Games room with table tennis", "Family bathroom with bath", "​Drying room with shower room", "​Dishwasher", "​Washing machine",
  "​Free WIFI​", "​BBQ & outdoor dining area", "Storage for sports equipment", "Parking for 4 cars", "​Large garden"]

puts "Creating features for Westcott"

features.each do |feature|
  Feature.create!(name: feature, key:false, property_id: westcott[0][:id])
end

puts "Updating Douglas Cottage"

#Douglas Cottage

douglas = Property.where(code: 541233).update(
  enabled: true,
  name: "Douglas Cottage",
  latitude: 57.248584,
  longitude: -3.754041,
  headline: "Cosy, pet friendly, period cottage oozing style and comfort in a central village location",
  description: "Douglas Cottage is our first lodge in lovely Boat of Garten, one of the most charming and friendly villages in Strathspey. Locally known just as “Boat”, this little place is the final stop on the delightful Strathspey Steam Railway, running regularly from Aviemore. You’ll often hear the whistle and hiss of steam as the beautiful vintage engine pulls in.

A welcoming village with a wonderful community spirit (they built their own contemporary village hall recently which hosts one-off events and regular film nights), Boat is a great central place to base your holiday. Only a few minutes drive from Aviemore, it’s also convenient for visiting the other towns and villages in the area - Grantown on Spey, Nethy Bridge and Carrbridge are all less than 15 minutes away. This really is a wonderful location whether you like your Cairngorms break quiet and restful or action packed!

The cottage is in fact one of the old steam railway cottages built for workers on the line which originally linked Aviemore to Forres, and still retains many of its original features and old-world feel. However it has been cleverly and sympathetically restored to open it out to 21st century proportions. It provides plenty of light and enough space for a large family or group of six friends, and to ensure it’s warm and cosy enough for even the snowiest of Cairngorms winters.

The renovation also includes some fabulous contemporary touches - such as a statement wooden open staircase - which sits alongside its gorgeous period features such as the original stone hearths. Opposite the comfy living room with its wood burning stove, there is a snug room which is perfect for reading and playing games. Towards the back of the cottage are two bedrooms - a double with a king size bed and a twin - and a large family shower room.

The kitchen is large and welcoming, with a breakfast bar as well as a round dining table seating 6. In the warmer months you can throw open the French windows to the garden and enjoy drinks and dinner alfresco. It’s fully fenced so safe and secure for your children and pets. Off the kitchen is the utility room with washing machine and drying space for all your outdoor clothes. Up the stairs you’ll find the third bedroom - another double with king size bed - and another large bathroom with bath and shower.

Walkers and bike lovers are in for a treat, with immediate access to the wooded paths into Kinveachy Forest which make up part of the Speyside Way and National Cycle Route 7. At Douglas Cottage you are literally steps away from a fantastic independent bike shop, Ride Cairngorm, who can provide hire bikes and equipment for your two-wheeled adventures. You’ll never go hungry either, as you’re just over the road from the lovely 1896 Gallery Cafe, almost next door to the Boat Hotel and restaurant, and only a minute’s walk from one of our area’s most popular restaurants, Anderson’s. Of course Loch Garten with its breeding pair of ospreys is close by, giving the village its nickname of “the osprey village”.

Whatever you're looking for in your Cairngorms break - from an action and adventure packed week to simply some much needed rest and relaxation - you'll find that the best of Strathspey is on your doorstep at Douglas Cottage.",
  wood_stove: true,
  hot_tub: false,
  pet_friendly: true,
  sauna: false,
  games_room: false,
  in_aviemore: false,
  in_country: true,
  we_love: "That impressive stair case leading to the most luxurious master suite.",
  meta_title: "Douglas Cottage - Cosy pet friendly cottage in a central village location",
  meta_description: "Cosy, pet friendly, period cottage oozing style and comfort in a central village location."
  )

features = ["Sleeps 6 with space for cots", "​Pet friendly", "1x king suite with bath", "​1x king room", "1x twin room",
  "Smart TV", "Snug room", "Wood-burning stove", "Period features", "Fantastic location", "Ground floor shower room",
  "​Utility room", "​Dishwasher", "​Washing machine", "​Bike Store", "​Free WIFI​", "​BBQ", "Enclosed garden", "Parking for 3 cars",
  "Village centre location"]

puts "Creating features for Douglas Lodge"

features.each do |feature|
  Feature.create!(name: feature, key:false, property_id: douglas[0][:id])
end

puts "Updating Tomdhu Lodge"

#Tomdhu Lodge

tomdhu = Property.where(code: 542599).update(
  enabled: true,
  name: "Tomdhu Lodge",
  latitude: 57.261007,
  longitude: -3.702375,
  headline: "With a hot tub and double-sided wood burner - it's perfect for lovers of great interiors, as well as lovers of the great outdoors",
  description: "Love contemporary interiors? Then expect serious house envy at Tomdhu Lodge! It’s been exquisitely designed to be a sleek but endlessly practical take on luxury contemporary Highland holiday living. Look past the gorgeous furnishings and elegant, minimalist fittings and you’ll see that this beautiful house has been very cleverly built, finished and equipped to provide all the features you’ll ever need on a self-catered holiday. But you’ll also discover some wonderfully thoughtful extras, which take your Cairngorms escape to the next level of stress-free relaxation and luxury.

The hub of this house is the huge open-plan, double-height living, dining and kitchen area. With glass along two sides, you can really take in the wonderful views towards Boat of Garten, but the inside is pretty fantastic too. In the centre is the double-sided wood burning stove with its statement chimneypiece of granite, slate and lapped larch. On the other side to the living area is a large dining table, the ideal spot for a bit of after-dinner route-planning. Because next to it is the oversized OS map of the entire Cairngorms area – the first clue that this place has been designed by someone who really loves the adventurous outdoor life.

The kitchen is a foodie’s dream; not only do you have a stylish and practical island to work and serve up on, but you also have a really well-stocked arsenal of cookware and tableware, a Nespresso machine and even your own spacious butler’s pantry! Rather brilliantly, it contains a bank of Tupperware and napkins - ideal for preparing a picnic or packed lunch for all eight of you to spend a day on the hills.

Off the hallway from the kitchen is your sumptuous family shower room, and the wide entrance porch. This has been fitted out so that your departure and return each day is as smooth a process as possible, whatever the weather outside. Lots of space to sit and put on or remove boots and wet clothing – but to make your life even easier, a separate laundry and drying room to one side. Washer, tumble drier, heated clothes rail, clothes airer, boot rack and lots of hanging space – the perfect place to dry all your waterproofs, ski wear, even wetsuits, ready for the next day. There is even a large comfortable dog bed for those pets who like to curl up somewhere cosy and quiet after a day bounding about the mountains!

Further along the hall is another luxurious family bathroom with both shower and very deep bathtub. There are two double bedrooms with king size beds on the ground floor, whilst the twin bedrooms sit at either side of the top of the staircase. All four bedrooms are decorated in a cool and contemporary style designed to provide you with a really relaxing retreat at the very end of your day.

To seriously unwind though, you’ll want to spend some time in the evenings enjoying the large 8-person hot tub right outside the patio doors, where there’s also an outdoor dining area and firepit.

You could not ask for a more beautifully designed and comprehensively equipped house than Tomdhu Lodge, whether your adventures involve high mountain walking, climbing, skiing or simply enjoying the fresh air and views of our stunning part of the Highlands. We’re sure that a stay here will inspire you to live the Cairngorms life in all its exciting possibilities!",
  wood_stove: true,
  hot_tub: true,
  pet_friendly: true,
  sauna: false,
  games_room: false,
  in_aviemore: false,
  in_country: true,
  we_love: "The freestanding fireplace in the lounge and dining area is such a centrepiece – warming and welcoming but with a touch of glamorous luxury too!",
  meta_title: "Tomdhu Lodge - double sided wood burner and hot tub - Cairngorms National Park",
  meta_description: "With a hot tub and double-sided wood burner in the Cairngorms National Park - perfect for lovers of great interiors, as well as lovers of the great outdoors"
  )

features = ["Sleeps 8 with space for cots", "2x king rooms", "2x twin rooms", "1x family bathroom", "Freestanding bath",
  "Shower room", "Double sided ​woodburner", "​Pet friendly", "Large kitchen-diner", "​Butlers pantry", "​Coffee machine",
  "Utility/drying room", "​Dishwasher", "​Washing machine", "​Free WIFI", "Hot tub", "Outdoor dining", "​Panoramic views",
  "​Storage for sports equipment", "​Off-street parking"]

puts "Creating features for Tomdhu"

features.each do |feature|
  Feature.create!(name: feature, key:false, property_id: tomdhu[0][:id])
end

puts "Updating Rymore Wood Lodge"

#Rymore Wood Lodge

rymore = Property.where(code: 542702).update(
  enabled: true,
  name: "Rymore Wood Lodge",
  latitude: 57.225450,
  longitude: -3.625530,
  headline: "Spacious and homely with a wood burner, this holiday lodge is a charming retreat in the forest and a wildlife lover’s paradise",
  description: "Take a drive along the most enchanting forest road, winding between towering pines and the beautiful Loch Garten, and you will arrive at Rymore Wood Lodge, set in its own private 20 acres of woodland, surrounded by the RSPB nature reserve, in the heart of the Abernethy Forest. This lodge is a nature lover’s dream, with trees all around that bring birds, red squirrels, badgers, pine marten and deer to the garden, where you can sit and watch them from the warmth of the kitchen.

The lodge has been designed in a traditional and homely style, and has a wonderfully cosy and welcoming Alpine feel throughout. There is a huge farmhouse kitchen with a sweet and very helpful little woodburning stove where you can boil water for your breakfast or afternoon pot of tea. This homely kitchen looks out down the garden and over the wildlife feeding area. Allowing you to observe all of the wildlife visitors right from the breakfast table! Your oven, fridge, dishwasher, microwave and Nespresso machine are here too, with the laundry machines and an extra fridge and freezer tucked away in the utility room.

Through from the kitchen is the large and comfortable sitting room with its big open fire and French windows onto the garden to the side. A perfect place to relax and unwind with family and friends, particularly when the fire crackles away in the autumn and winter months.

Also on the ground floor is a double bedroom with kingsize bed, which looks out through the French windows onto the bird feeding area – the perfect location for morning coffee whilst the wildlife enjoy their breakfast! Next door is a family bath and shower room.

Upstairs is the master bedroom with its kingsize bed and an ensuite bathroom. There are two large twin bedrooms upstairs too, both of which have windows looking out over the forest to three sides. There is a family shower room that these two rooms share between them.

All of the bedrooms have got large walk in cupboards; in fact throughout the house you will find all the storage you could possibly need for even the most comprehensively equipped bunch of adventurers! Even the large porch is a perfect size to house everyone’s coats, boots and other outdoor clothing.

The big lawned garden is a fantastic space for kids to play – it’s often used for croquet in the summer, and for rolling snowballs to make snowmen in the winter! Don’t forget to look out for animal footprints in the fresh snow every morning – you may be surprised at who has come for a night-time visit – perhaps some reclusive pine martens or deer?

This is a lodge which truly reflects its surroundings, and in which you will instantly feel at home. Spacious, welcoming and well-equipped, it’s the ideal base from which to explore our area. Make yourself comfortable in the forest!",
  wood_stove: true,
  hot_tub: false,
  pet_friendly: true,
  sauna: false,
  games_room: false,
  in_aviemore: false,
  in_country: true,
  we_love: "You’re right in the heart of the magnificent Abernethy Forest here – no neighbours other than the birds, squirrel and deer!"
  )

features = ["Sleeps 8 with space for cots", "1x king bed ground floor", "1x king bed with ensuite", "2x twin rooms",
  "1x shower room", "​1x family bathroom", "Wood burner", "​Open fire", "​Pet friendly", "Large kitchen-diner", "Wildlife viewing area",
  "​Coffee machine", "Utility room", "​Dishwasher", "​Washing machine", "​Free WIFI", "Outdoor dining", "​Uniquely private location",
  "​Large garden", "​Storage for sports equipment", "​Off-street parking"]

puts "Creating features for Rymore Lodge"

features.each do |feature|
  Feature.create!(name: feature, key:false, property_id: rymore[0][:id])
end

puts "Finished creating properties"

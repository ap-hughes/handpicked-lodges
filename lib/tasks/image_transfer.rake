namespace :image_transfer do
  desc "transfer a post's main photo to Active Storage and AWS"
  task transfer_post_image_to_aws: :environment do
    Post.all.each do |post|
      url = Cloudinary::Utils.cloudinary_api_url(post.photo)
      url = "http#{url.split('http').last}"
      image = open(url)
      post.image.attach(
        io: image,
        filename: post.photo.file.public_id,
        content_type: "#{post.photo.file.resource_type}/#{post.photo.file.format}"
      )
    end
  end

  desc "transfer a property's hero image to Active Storage and AWS"
  task transfer_prop_main_image_to_aws: :environment do
    Property.where.not(hero_image: nil).each do |property|
      url = Cloudinary::Utils.cloudinary_api_url(property.hero_image)
      url = "http#{url.split('http').last}"
      image = open(url)
      property.main_image.attach(
        io: image,
        filename: property.hero_image.file.public_id,
        content_type: "#{property.hero_image.file.resource_type}/#{property.hero_image.file.format}"
      )
    end
  end

  desc "transfer a property's remaining images to Active Storage and AWS"
  task transfer_prop_images_to_aws: :environment do
    Property.where.not(hero_image: nil).each do |property|
      property.photos.each do |photo|
        url = Cloudinary::Utils.cloudinary_api_url(photo.image)
        url = "http#{url.split('http').last}"
        image = open(url)
        photo.picture.attach(
          io: image,
          filename: photo.image.file.public_id,
          content_type: "#{photo.image.file.resource_type}/#{photo.image.file.format}"
        )
      end
    end
  end
end

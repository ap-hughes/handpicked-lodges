class Uploads
  class << self
    def jpeg?(blob)
      blob.content_type.include? 'jpeg'
    end

    def optimize
      {
        strip: true
      }
    end

    def optimize_jpeg(quality)
      {
        strip: true,
        'sampling-factor': '4:2:2',
        quality: "#{quality}",
        interlace: 'JPEG',
        colorspace: 'sRGB'
      }
    end

    def optimize_hash(blob, quality)
      return optimize_jpeg(quality) if jpeg?(blob)
      optimize
    end

    def resize_to_limit(width:, height:, quality:, blob:)
      {
        resize: "#{width}x#{height}>"
      }.merge(optimize_hash(blob, quality))
    end

    def resize_to_fit(width:, height:, quality:, blob:)
      {
        resize: "#{width}x#{height}"
      }.merge(optimize_hash(blob, quality))
    end
  end
end

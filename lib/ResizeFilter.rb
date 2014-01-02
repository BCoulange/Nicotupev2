class ResizeFilter < Nanoc::Filter
  identifier :resize
  type :binary

  require "rmagick"
  include Magick

  def create_leads(source,tmp_folder,site)


    return ["/processed/lead/#{name}-home.#{ext}","/processed/lead/#{name}-thumbnail.#{ext}","/processed/lead/#{name}-bandeau.#{ext}"]
  end


  def run(filename, params={})
    raise "you need to specify :width and :height" if params[:width].nil? || params[:height].nil?
      # image par défaut
      # if site.config['process_images']['tmp_folder'].nil?
        tmp_folder = "/tmp/nanoc"
      # else
      #   tmp_folder site.config['process_images']['tmp_folder']
      # end

      Dir.mkdir tmp_folder unless File.exists? tmp_folder


      img = Magick::ImageList.new filename
      img2 = img.resize_to_fill params[:width], params[:height]
      img2.write output_filename


  end

end

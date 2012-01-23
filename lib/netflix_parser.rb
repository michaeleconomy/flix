class NetflixParser
  
  def self.parse(ratings_xml)
    parsed_xml = Nokogiri::XML(ratings_xml)
    
    parsed_xml.css("ratings_item").collect do |rating_xml|
      parse_rating(rating_xml)
    end
  end
  
  def self.parse_rating(rating_xml)
    rating = {}
    rating[:movie] = movie = {}
    
    id_url = rating_xml.at_css('id').inner_html
    id_url =~ /(\d+)$/
    movie[:netflix_id] = $1
    
    movie[:title] = rating_xml.at_css('title')['regular']
    if runtime_node = rating_xml.at_css('runtime')
      movie[:length] = runtime_node.inner_html
    end
    movie[:release_at] = rating_xml.at_css('release_year').inner_html
    movie[:release_at_accuracy] = "y"
    rating_xml.css("[scheme]").each do |node|
      if node['scheme'] == 'http://api.netflix.com/categories/mpaa_ratings'
        movie[:mpaa_rating] = node["label"]
        break
      end
    end
    
    rating[:rating] = rating_xml.at_css("user_rating").inner_html
    rating
  rescue => e
    Rails.logger.error "error parsing rating:"
    Rails.logger.error rating_xml.inner_html
    raise e
  end
  
end
module QuickSearch
  class ContentdmSearcher < QuickSearch::Searcher

    def search
      url = base_url + parameters.to_query
			Rails.logger.info "ContenDM query url: #{url}"
      raw_response = @http.get(url)
      @response = JSON.parse(raw_response.body)
    end

    def results
      if results_list
        results_list
      else
        @results_list = []
        @response['records'].each do |record|
          result = OpenStruct.new

          result.title = title(record)
          result.link = link(record)
          result.description = description(record)
					result.thumbnail = thumbnail(record)


          @results_list << result
        end
        @results_list
      end
    end


    private

    def base_url
      config['api_url'] + "/dmwebservices/index.php?"
    end

    def parameters
      {
          'q' => "dmQuery/#{collections_to_search}/CISOSEARCHALL^#{http_request_queries['not_escaped']}^all^and/" + 
					"title!descri/#{sort}/#{@per_page}/#{@offset}/1/0/0/0/0/0/json",
      }
    end

    def title(record)
      record['title']

    end

    def link(record)
      "#{config['records_url']}/cdm/#{object_type(record)}/collection#{record['collection']}/id/#{record['pointer']}"

    end

    def description(record)
      record['description']
    end

    def object_type(record)
      if record['filetype'] == 'cpd'
        'compoundobject'
      else
        'singleitem'
      end
    end

    def thumbnail(record)
      "#{config['records_url']}/utils/getthumbnail/collection#{record['collection']}/id/#{record['pointer']}"
    end		

		def sort
			if config.has_key? 'custom_sort'
				"#{config['custom_sort']}"
			else 
				"nosort"
			end
		end

	  def collections_to_search
		  if config.has_key? 'collections'
			  config['collections'].join('!')
			else
				'all'
			end
		end

		def config
			QuickSearch::Engine::CONTENTDM_CONFIG
		end
  end
end

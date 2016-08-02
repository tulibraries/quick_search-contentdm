module QuickSearch
  class ContentdmSearcher < QuickSearch::Searcher

    def search
      url = base_url + parameters.to_query
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


          @results_list << result
        end
        @results_list
      end
    end


    private

    def base_url
      QuickSearch::Engine::CONTENTDM_CONFIG[:api_url] + "/dmwebservices/index.php?"
    end

    def parameters
      {
          'q' => "dmQuery/all/CISOSEARCHALL^#{http_request_queries['not_escaped']}^all^and/title!descri/" +
              "nosort/#{@per_page}/#{@offset}/1/0/0/0/0/0/json",
      }
    end

    def title(record)
      record['title']

    end

    def link(record)
      "#{QuickSearch::Engine::CONTENTDM_CONFIG[:records_url]}/cdm/#{object_type(record)}/collection/#{record['collection']}/id/#{record['pointer']}"

    end

    def description(record)
      record['description']
    end

    def object_type(record)
      if record['filetype'] == 'cpd'
        return 'compoundobject'
      else
        return 'singleitem'
      end
    end

  end
end
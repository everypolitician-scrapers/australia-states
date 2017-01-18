#!/bin/env ruby
# encoding: utf-8
# frozen_string_literal: true

require 'pry'
require 'scraperwiki'
require 'wikidata/area'
require 'wikidata/fetcher'

# P39: position held
# P768: electoral district

query = <<QUERY
  SELECT DISTINCT ?state
  WHERE
  {
  	?item ps:P39 wd:%s .
    ?item pq:P768 ?state .
  }
QUERY

member_of_house = 'Q6814428' # member of the Australian Senate

wanted = EveryPolitician::Wikidata.sparql(query % member_of_house)
raise 'No ids' if wanted.empty?

# data = Wikidata::Areas.new(ids: wanted).data
# ScraperWiki.save_sqlite(%i(id), data)

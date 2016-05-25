require 'pp'
class IssueIndexer

  attr_accessor :issue

  def self.run(issue_id=nil)
    total_issues = Issue.count
    t0 = Time.now
    STDERR.puts "GOING TO BE INDEXING #{issue_id || 'everything'}"
    Issue.all.each_with_index do |issue, j|
      next if issue_id && issue.id != issue_id.to_i
      indexer = self.new(issue)
      indexer.index
      t1 = Time.now
      STDERR.puts "-- committed: #{j} / #{total_issues} : #{t1 - t0}"
      t0 = t1
    end  
  end

  def initialize(issue)
    @issue = issue
  end

  def index
    Rails.configuration.batch_commit = true

    solr_doc = generate_solr_doc
    @issue.pages.each do |page|
      # next unless page.id == 70934
      PageIndexer.new(page).index(solr_doc)
    end
    Blacklight.default_index.connection.commit
  end

  def generate_solr_doc
    solr_doc = {}

    d = @issue.date_issued.to_date
    pp @issue
    dt = d.strftime('%B %d, %Y')

    publication = @issue.publication

    solr_doc[:id] = "#{@issue.ht_barcode}-#{@issue.slug}"
    solr_doc[:date_issued_display] = dt
    solr_doc[:issue_no_t] = @issue.issue_no
    solr_doc[:date_issued_dt] = d
    solr_doc[:date_issued_yyyy_ti] = d.strftime('%Y').to_i
    solr_doc[:date_issued_yyyymm_ti] = d.strftime('%Y%m').to_i
    solr_doc[:date_issued_yyyymmdd_ti] = d.strftime('%Y%m%d').to_i
    solr_doc[:date_issued_link] = @issue.slug(false)
    solr_doc[:ht_barcode] = @issue.ht_barcode
    solr_doc[:ht_namespace] = @issue.ht_namespace
    solr_doc[:publication_link] = publication.slug
    solr_doc[:publication_label] = publication.title
    solr_doc[:issue_sequence] = @issue.issue_sequence
    solr_doc[:pages] = []

    solr_doc[:manifest] = get_image_info

    Page.where(issue_id: issue.id).order(:sequence).each do |page|
      # solr_doc[:pages] << [ page.id, page.sequence, page.page_no ]
      solr_doc[:pages] << [
        page.id,
        "#{solr_doc[:id]}-#{page.sequence}",
        page.sequence,
        page.page_no
      ]
    end
    solr_doc
  end

  def get_image_info
    info_data = File.read(Rails.root.join(
      Rails.configuration.sdrdataroot, 
      "#{@issue.ht_namespace}/#{@issue.ht_barcode}.metadata.js"))
    tmp = JSON.parse(info_data)
    info = {}
    tmp.keys.each do |key|
      new_key = @issue.ht_barcode + "/IMG" + File.basename(key, ".*")
      info[new_key] = tmp[key]
    end
    info
  end


end
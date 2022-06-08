class BlogPostsController < ApplicationController
  before_action :set_blog_post, only: %i[ show edit update destroy ]

  # GET /blog_posts or /blog_posts.json
  def index
    api = Prismic.api('https://blog-webs.cdn.prismic.io/api/v1')
    response = api.query(Prismic::Predicates.at("document.type", "brodie"), { "orderings" => "[my.blog-post.date desc]" })
    @documents = response.results
    
  end

  def show
    api = Prismic.api('https://blog-webs.cdn.prismic.io/api/v1')
    response = api.query(Prismic::Predicates.at("document.id", "1"),{ "lang" => "*" })
    document = response.results[0]
  end

end
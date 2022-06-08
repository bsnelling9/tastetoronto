class BlogPostsController < ApplicationController
  before_action :set_blog_post, only: %i[ show edit update destroy ]

  # GET /blog_posts or /blog_posts.json
  def index
    api = Prismic.api('https://blog-webs.cdn.prismic.io/api/v1')
    response = api.query(Prismic::Predicates.at("document.type", "brodie"), { "orderings" => "[my.blog-post.date desc]" })
    @documents = response.results
    logger.info(@documents)
 
  end

  def show
  	@blog_post = blog_post.find(params[:id])
    api = Prismic.api('https://blog-webs.cdn.prismic.io/api/v1')
    response = api.query(Prismic::Predicates.at("document.id", id),{ "lang" => "*" })
    post = response.results[0]
  end

end
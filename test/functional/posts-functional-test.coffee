Browser = require("zombie")
should = require("should")
describe 'index', ->
  before (done) ->
    @browser = new Browser
    @browser.visit("http://localhost:3000/").then(done, done)

  it 'shows the title', ->
    @browser.text("H1#blog-title").should.eql "My Test Blog"

describe 'add/remove', ->
  browser = new Browser

  before (done) ->
    browser.visit("http://localhost:3000/")
      .then ->
        browser.clickLink('a#new-post')
      .then(done, done)

  it 'display a post', ->
    browser.text('legend').should.eql "Write New Post"

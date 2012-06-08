Browser = require "zombie"
should = require "should"
mongoose = require 'mongoose'

Post   = require '../../models/Post'


describe 'index', ->
  before (done) ->
    @browser = new Browser
    @browser.visit("http://localhost:3000/").then(done, done)

  it 'shows the title', ->
    @browser.text("H1#blog-title").should.eql "My Test Blog"

describe 'edit', ->
  browser = new Browser

  it 'can add and then remove a post', (done) ->
    browser.visit("http://localhost:3000/")
      .then ->
        browser.clickLink('a#new-post')
      .then ->
        browser.fill '#title', "a test title"
        browser.fill '#post', 'a test post content'
        browser.pressButton('input[type="submit"]')
      .then ->
        browser.text('#posts').should.include "a test title"
        null
      .then ->
        li = browser.query 'li:contains("a test title")'
        deleteBtn = browser.query('a.delete', li)
        browser.clickLink deleteBtn
      .then ->
        browser.text('#posts').should.not.include "a test title"
        null
      .then(done, done)




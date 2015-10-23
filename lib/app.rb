require 'sinatra'
require 'slim'

get '/?' do
	redirect "http://localhost:4567/home"
end

get '/home/?' do
  $blog_posts ||= []
  slim <<-VIEW
    doctype html
    html
      head
        title My Blog - home
      body
        h1 Blog Listings
        form action='/create' method='GET'
          button id='create-post' Create Post
        br
        <table border="1" cellpadding="10">  
          <tr><th>Author</th><th>Title</th><th style="width:80%; max-width:600px">Blog</th></tr>
            - $blog_posts.each do |post|
              <tr>
                <td>
                  =post['author']
                </td>
                <td>
                  <a href="/view/post/">
                    =post['title']
                  </a>
                </td>
                <td>
                  =post['content']
                </td>
              </tr>
        </table>   
          
  VIEW
  
end

get '/create/?' do 
slim <<-VIEW
  doctype html
  html
  	head
      title My Blog - create
    body
      h1 New Post Entry
  	  form action='/create/post' method='POST'
        h2 Author Name
        input type='text' id='post-author' name='author'
        h2 Title
        input type='text' id='post-title' name='title'
        h2 Post body
        <textarea id='post-body' name='content' rows="25" cols="150">
        </textarea>
        br
        br
        button id='submit-post' Submit
      br
      form action='/cancel' method='POST'
        button id='cancel-post' Cancel
      form action='/home' method='GET'
        button id='go-home' Home
VIEW
end


post '/create/post' do
  $blog_posts ||= []
  @author = params[:author]
  @title = params[:title]
  @content = params[:content]
  if params[:title].empty? || params[:content].empty? || params[:author].empty?
    slim <<-VIEW
      doctype html
      html
        head
          title Invalid Entry
        body
          h1 "Error! You left a field blank."
          form action='/home' method='GET'
            button id='go-home' Home
    VIEW

  else
    if $blog_posts.any?{ |hash| hash["title"] == params[:title] }
      "Error! No duplicates!"
    else
    $blog_posts << {"title" => params[:title], "content" => params[:content], "author" => params[:author]}
      slim <<-VIEW
        doctype html
        html
          form action='/home' method='GET'
            button id='go-home' Home
            h1 Submitted! 
            br
            h2 Author: <small>#{@author}</small>
            br
            h2 Title:  <small> #{@title}</small>
            br
            h2 Post: 
            br #{@content}
              
            
          

      VIEW
    #/n #{$blog_posts}
    #<%= simple_format(#{@content}) %>
    end
  end
end


post '/cancel' do
slim <<-VIEW
  doctype html
  html
    head
      title Post - Canceled
    body
      form action='/home' method='GET'
        h1 Post canceled!
        button id='go-home' Home
VIEW
end

get '/view/post/*' do
slim <<-VIEW


VIEW
end



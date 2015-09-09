require_relative '../spec_helper'

describe "Tumblr" do

	it "can create new users" do
		expect {User.new}.to_not raise_error
	end

	it "can create new posts" do
		expect {Post.new}.to_not raise_error
	end

	it "can create new comments" do
		expect {Comment.new}.to_not raise_error
	end


	describe "User" do
		before do
			@user = User.create(:username => "taylorswift", :email => "taylor@taylorswift.com")
		end

		it "has a username" do
			expect(@user.username).to eq("taylorswift")
		end	

		it "has an email address" do
			expect(@user.email).to eq("taylor@taylorswift.com")
		end	
	end

	describe "Post" do
		before do
			@post = Post.create(:title => "To Apple, Love Taylor", :content => "I write this to explain why I'll be holding back my album, 1989, from the new...")
		end

		it "has a title" do 
			expect(@post.title).to eq("To Apple, Love Taylor")
		end

		it "has content" do 
			expect(@post.content).to eq("I write this to explain why I'll be holding back my album, 1989, from the new...")
		end
	end

	describe "Comment" do
		before do
			@comment = Comment.create(:content => "First!")
		end

		it "has content" do
			expect(@comment.content).to eq("First!")
		end
	end

	describe "ActiveRecord Associations" do

		describe "User" do

			before(:all) do
				@user = User.create(:username => "taylorswift", :email => "taylor@taylorswift.com")
			end
	
			it "has many posts" do
				post = Post.create(:title => "Hello", :content => "World", :user => @user)
				expect(@user.posts).to match_array(Post.all)
			end

			it "has many comments" do
				comment = Comment.create(:user => @user, :content => "First!!!")
				expect(@user.comments).to match_array(Comment.all)
			end
		end

		describe "Post" do
			before do
				@post = Post.create(:title => "Hello", :content => "World")
			end

			it "belongs to a user" do
				user = User.create(:username => "taylorswift", :email => "taylor@taylorswift.com")
				@post.update(:user => user)
				expect(@post.user).to eq(user)
			end

			it "has many comments" do
				Comment.create(:post => @post, :content => "First!!!")
				expect(@post.comments).to match_array(Comment.all)
			end
		end

		describe "Comment" do
			before do
				@user = User.create(:username => "taylorswift", :email => "taylor@taylorswift.com")
				@post = Post.create(:title => "Hello", :content => "World", :user => @user)
				@comment = Comment.create(:content => "First!!", :user => @user, :post => @post)
			end

			it "belongs to a user" do
				expect(@comment.user).to eq(@user)
			end

			it "belongs to a post" do
				expect(@comment.post).to eq(@post)
			end
		end
	end
end
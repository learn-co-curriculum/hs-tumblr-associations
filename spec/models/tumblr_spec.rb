require_relative '../spec_helper'

describe "Tumblr" do
	describe "User" do
		before(:all) do
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
		before(:all) do
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
		before(:all) do
			@comment = Comment.create(:content => "First!")
		end

		it "has content" do
			expect(@comment.content).to eq("First!")
		end
	end

	describe "ActiveRecord Associations" do
		before(:all) do
			@user = User.create(:username => "taylorswift", :email => "taylor@taylorswift.com")
			@post = Post.create(:title => "To Apple, Love Taylor", :content => "I write this to explain why I'll be holding back my album, 1989, from the new...")
			@comment = Comment.create(:content => "First!")
			@comment.update(:user => @user, :post => @post)
			@post.update(:user => @user)
		end

		describe "User" do
			it "has many posts" do
				expect(@user.posts).to include(@post)
			end

			it "has many comments" do
				expect(@user.comments).to include(@comment)
			end
		end

		describe "Post" do
			it "belongs to a user" do
				expect(@post.user).to eq(@user)
			end

			it "has many comments" do
				expect(@post.comments).to include(@comment)
			end
		end

		describe "Comment" do
			it "belongs to a user" do
				expect(@comment.user).to eq(@user)
			end

			it "belongs to a post" do
				expect(@comment.post).to eq(@post)
			end
		end
	end
end
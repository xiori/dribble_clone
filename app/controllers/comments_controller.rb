class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    #on recupere dans une variable shot , le shot par son id
   @shot = Shot.find(params[:shot_id])
    #on recupere dans une variable comment ,le commentaire a creer par le shot_id avec les comments_params requis( name & cotent)
   @comment = @shot.comments.create(comment_params)
    # on assimile le curent_user id à user_id 
   @comment.user_id = current_user.id
   #on save la requete 
   @comment.save!
   #on redirige vers le shot
   redirect_to shot_path(@shot)
  end

  def destroy
    #on recupere dans une variable shot , le shot par son id
    @shot = Shot.find(params[:shot_id])
    #on recupere dans une variable comment , le commentaire a supprimer , par son id
    @comment = @shot.comments.find(params[:id])
    #on detruit le commentaire
    @comment.destroy
    #on redirige vers le shot
    redirect_to shot_path(@shot)
  end

  private
  def comment_params
    #les paramaetre requis pour comment , name et content
    params.require(:comment).permit(:name, :content)
  end
end

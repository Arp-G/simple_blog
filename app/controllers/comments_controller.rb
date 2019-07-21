class CommentsController < ApplicationController


def create
	@comment=Comment.new(comment_params)

	@comment.blog_id = params[:blog_id]

	if @comment.save
		redirect_to request.referrer, notice: "Comment was posted successfully."
	else
		str = "Comment could not be posted due to the following errors: "
		@comment.errors.full_messages.each do |error|
			str+=error + ", "
		end

		redirect_to request.referrer, notice: str
	end
end


private

    def comment_params
      params.require(:comment).permit(:writter, :content)
    end

end

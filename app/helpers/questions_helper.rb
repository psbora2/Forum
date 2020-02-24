module QuestionsHelper

  # get the child of the Question
  def parent_question(question_id)
    # get all the child answer of the articles
    answers = Answer.where('answers.question_id = ?', question_id)
    # get all child answer of parent answer
    answers.map  do |answer|
      # @answer instance for answer partial
      @answer = answer
      #get all the child answer of each parent answer
      child_answer(answer.id)
    end.join.html_safe
  end

  def child_answer(parent_id)
    answer_array = Answer.where('answers.parent_id = ?', parent_id)
    # if parent_answer has not child answer then return the answer
    if answer_array.empty?
      return render 'answers/answer'
    else
      # if parent_answer has child answer then get the child answer of parent answer
      k = (
      answer_array.map  do |answer|
        @answer = answer
        child_answer(answer.id)
      end
      ).join.html_safe
      # @answer instance variable for partial for answer 
      @answer = Answer.find(parent_id)
      # html of parent answer plus child answer enclose in the replies div tag
      k = (render 'answers/answer').html_safe + content_tag(:div,k, class: "replies").html_safe
      return (k)
    end
  end
end

package nicole.questionnaire.domain;
import org.hibernate.validator.constraints.NotEmpty;

/**
 * Created by Administrator on 2017/1/12.
 */
public class Answer {

    private int answerId;
    private int userId;
    private long questionId;
    private String answer;

    public Answer(){

    }

    public int getAnswerId() {
        return answerId;
    }

    public void setAnswerId(int answerId) {
        this.answerId = answerId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public long getQuestionId() {
        return questionId;
    }

    public void setQuestionId(long questionId) {
        this.questionId = questionId;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }
}

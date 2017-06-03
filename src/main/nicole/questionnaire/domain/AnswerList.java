package nicole.questionnaire.domain;

import org.hibernate.validator.constraints.NotEmpty;

import java.util.List;

/**
 * Created by xl on 2017/2/27.
 */
public class AnswerList {
    private List<Answer> answerList;

    //要为Set添加预定义大小容器

    public AnswerList(){
    }
    public List<Answer> getAnswerList() {
        return answerList;
    }

    public void setAnswerList(List<Answer> answerList) {
        this.answerList = answerList;
    }
}

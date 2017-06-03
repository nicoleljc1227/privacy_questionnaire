package nicole.questionnaire.dao;

import nicole.questionnaire.domain.Answer;

import java.util.List;

/**
 * Created by xl on 2017/2/27.
 */
public interface AnswerDao {

    public int[] addAnswer(String sql,List<Answer> answerList);
}

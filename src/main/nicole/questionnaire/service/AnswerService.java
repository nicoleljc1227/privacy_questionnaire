package nicole.questionnaire.service;

import nicole.questionnaire.domain.Answer;

import java.util.List;

/**
 * Created by xl on 2017/2/28.
 */
public interface AnswerService {
    public int[] saveAnswer(String sql, List<Answer> list);
}

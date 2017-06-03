package nicole.questionnaire.service;

import nicole.questionnaire.dao.AnswerDao;
import nicole.questionnaire.domain.Answer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by xl on 2017/2/28.
 */
@Service
public class AnswerDaoImp implements AnswerService {

    @Autowired
    private AnswerDao answerDao;
    public int[] saveAnswer(String sql, List<Answer> list) {
        return answerDao.addAnswer(sql,list);
    }
}

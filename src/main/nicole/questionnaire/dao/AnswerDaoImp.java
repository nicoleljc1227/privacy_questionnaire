package nicole.questionnaire.dao;

import nicole.questionnaire.domain.Answer;
import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

/**
 * Created by xl on 2017/2/27.
 */
@Repository("answerDao")
public class AnswerDaoImp implements AnswerDao {

    @Resource(name="jdbcTemplate")
    private JdbcTemplate jdbcTemplate;

    @Resource
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate){
        this.jdbcTemplate = jdbcTemplate;
    }

    public int[] addAnswer(String sql, final List<Answer> answerList) {
        int[] result = jdbcTemplate.batchUpdate(sql, new BatchPreparedStatementSetter() {
            public void setValues(PreparedStatement preparedStatement, int i) throws SQLException {
                int userId = answerList.get(i).getUserId();
                long moodId = answerList.get(i).getQuestionId();
                String answerCont = answerList.get(i).getAnswer();
                preparedStatement.setInt(1,userId);
                preparedStatement.setLong(2,moodId);
                preparedStatement.setString(3,answerCont);

            }
            public int getBatchSize() {
                return answerList.size();
            }
        });
        return result;
    }
}

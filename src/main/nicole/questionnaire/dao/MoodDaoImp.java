package nicole.questionnaire.dao;

import nicole.questionnaire.domain.Mood;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * Created by Administrator on 2017/1/8.
 */

@Repository("moodDao")//让spring创建一个名字叫moodDao的MoodDaoImp的实例
public class MoodDaoImp implements MoodDao {

    @Resource(name="jdbcTemplate")
    private JdbcTemplate jdbcTemplate;
    /*public JdbcTemplate getJdbcTemplate(){
        return jdbcTemplate;
    }*/

    //jdbcTemplate初始化对应<bean id="moodDaoImp>

    @Resource
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate){
        this.jdbcTemplate = jdbcTemplate;
    }
    public List<Mood> findList(String sql) {

        MoodRowMapper moodRowMapper = new MoodRowMapper();
        return jdbcTemplate.query(sql,moodRowMapper);
    }

    public class MoodRowMapper implements RowMapper<Mood>{


        public Mood mapRow(ResultSet resultSet, int i) throws SQLException {
            Mood mood = new Mood();
            mood.setMood_id(resultSet.getInt("mood_id"));
            mood.setMoodContent(resultSet.getString("Mood_cont"));
            mood.setAddress(resultSet.getString("address"));
            mood.setPublishTime(resultSet.getString("PubTime"));
            return mood;
        }
    }
}

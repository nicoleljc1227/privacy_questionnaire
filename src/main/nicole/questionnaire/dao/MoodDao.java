package nicole.questionnaire.dao;

import nicole.questionnaire.domain.Mood;

import java.util.List;

/**
 * Created by Administrator on 2017/1/6.
 */
public interface MoodDao {


    public List<Mood> findList(String sql);


}

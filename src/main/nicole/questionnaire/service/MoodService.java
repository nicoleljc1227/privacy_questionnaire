package nicole.questionnaire.service;


import nicole.questionnaire.domain.Mood;

import java.util.List;

/**
 * Created by Administrator on 2017/1/8.
 */
public interface MoodService {

    public List<Mood> selectMoodList(String sql);
}

package nicole.questionnaire.service;

import nicole.questionnaire.dao.MoodDao;
import nicole.questionnaire.domain.Mood;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.util.List;

/**
 * Created by Administrator on 2017/1/9.
 */
@Service
public class MoodServiceImp implements MoodService {
    @Autowired
    private MoodDao moodDao;//
    public List<Mood> selectMoodList(String sql) {
        return moodDao.findList(sql);
    }
}

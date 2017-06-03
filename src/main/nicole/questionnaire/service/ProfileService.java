package nicole.questionnaire.service;


import nicole.questionnaire.domain.Profile;

/**
 * Created by Administrator on 2017/1/12.
 */
public interface ProfileService {
    public int saveProfile(String sql, Profile profile);
    public String selectOneFiled(String sql);
}

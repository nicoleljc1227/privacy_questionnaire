package nicole.questionnaire.dao;


import nicole.questionnaire.domain.Profile;

/**
 * Created by Administrator on 2017/1/12.
 */
public interface ProfileDao {

    public int addProfile(String sql, Profile profile);

    public String checkOneFiledById(String sql);
}

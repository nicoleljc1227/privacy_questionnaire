package nicole.questionnaire.service;

import nicole.questionnaire.dao.ProfileDao;
import nicole.questionnaire.domain.Profile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


/**
 * Created by Administrator on 2017/1/12.
 */
@Service
public class ProfileServiceImp implements ProfileService {

    @Autowired
    private ProfileDao profileDao;
    public int saveProfile(String sql, Profile profile) {
        return profileDao.addProfile(sql,profile);
    }

    public String selectOneFiled(String sql) {
        return profileDao.checkOneFiledById(sql);
    }
}

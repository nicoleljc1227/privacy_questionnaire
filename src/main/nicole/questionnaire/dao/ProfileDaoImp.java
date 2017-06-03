package nicole.questionnaire.dao;

import nicole.questionnaire.domain.Profile;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map;

/**
 * Created by Administrator on 2017/1/12.
 */
@Repository("profileDao")
public class ProfileDaoImp implements ProfileDao{

    @Resource(name="jdbcTemplate")
    private JdbcTemplate jdbcTemplate;

    @Resource
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate){
        this.jdbcTemplate = jdbcTemplate;
    }

    /*public int addProfile(String sql,Profile profile) {
        Object args[] = {profile.getFiled1(),profile.getFiled2(),profile.getFiled3(),profile.getFiled4(),profile.getFiled5(),profile.getGender()
        ,profile.getAge(),profile.getEducation(),profile.getOccupation(),profile.getHomeTown(),profile.getCompany(),profile.getQqMail()};
        return jdbcTemplate.update(sql,args);
    }*/

    public int addProfile(String sql, final Profile profile) {
        final String sql_def = sql;
        KeyHolder keyHolder = new GeneratedKeyHolder();//要用这个才能接收 自增字段否则使用其他方法添加进去时 自增字段为0
        int  result = jdbcTemplate.update(new PreparedStatementCreator() {
            public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
                PreparedStatement ps = jdbcTemplate.getDataSource().getConnection()
                        .prepareStatement(sql_def,new String[] {"uid"});
               /* ps.setString(1,profile.getFiled1());
                ps.setString(2,profile.getFiled2());
                ps.setString(3,profile.getFiled3());
                ps.setString(4,profile.getFiled4());
                ps.setString(5,profile.getFiled5());
                ps.setString(6,profile.getGender());
                ps.setInt(7,profile.getAge());
                ps.setString(8,profile.getEducation());
                ps.setString(9,profile.getOccupation());
                ps.setString(10,profile.getH_province());
                ps.setString(11,profile.getH_city());
                ps.setString(12,profile.getH_county());
                ps.setString(13,profile.getQqMail());
                ps.setString(14,profile.getAddress());*/
                ps.setString(1,profile.getFiled1());
                ps.setString(2,profile.getFiled2());
                ps.setString(3,profile.getFiled3());
                ps.setString(4,profile.getFiled4());
                ps.setString(5,profile.getFiled5());
                ps.setString(6,profile.getGender());
                ps.setInt(7,profile.getAge());
                ps.setString(8,profile.getEducation());
                ps.setString(9,profile.getOccupation());
                ps.setString(11,profile.getHomeTown());

                ps.setString(10,profile.getQqMail());
                ps.setString(12,profile.getAddress());

                return ps;
            }
        },keyHolder);

        //profile.setUserId(keyHolder.getKey().intValue());
        if (result>0){
            return keyHolder.getKey().intValue();
        }else
            return 0;
    }

    public String checkOneFiledById(String sql) {
        Map map  = jdbcTemplate.queryForMap(sql);
        Object[] array  = map.values().toArray();
        return array[0].toString();
    }



}

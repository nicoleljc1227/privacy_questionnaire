package nicole.questionnaire.domain;

import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.Range;
import javax.validation.Valid;
import javax.validation.constraints.Pattern;
import java.sql.Date;

/**
 * Created by Administrator on 2017/1/12.
 */
public class Profile {
    private int userId;
    @NotEmpty(message = "必选!")
    @Pattern(regexp="是",message = "哎呀!您的选择是[${validatedValue}]您竟然没使用过任何一款社交应用?你确定么?")
    private String filed1;
    /*@NotEmpty(message = "必选!")
    private String leak;

    @NotEmpty(message = "必选!")
    private String delete;*/

    @NotEmpty(message = "必选!")

    private String filed2;
    @NotEmpty(message = "必选!")
    private String filed3;
    @NotEmpty(message = "必选!")
    private String filed4;
    @NotEmpty(message = "必选!")
    private String filed5;

    //@NotEmpty(message = "必选!")
    private String gender;

    @Range(min = 10, max = 70, message = "哎呀！您的年龄越界了!")
    private int age;
    @NotEmpty(message = "必选!")
    private String education;
    @NotEmpty(message = "必选!")
    private String occupation;
    //@NotEmpty(message = "请填写家乡所在省市!")
    @Pattern(regexp = "[\\u4e00-\\u9fa5]{2,6}",message = "请输入正确的省市!")
    private String homeTown;
    /*private String h_province;
    private String h_city;
    private String h_county;*/

    //@Pattern(regexp = "^[A-Za-z0-9\\u4e00-\\u9fa5]+@[a-zA-Z0-9_-]+(\\.[a-zA-Z0-9_-]+)+$",message = "请输入正确的邮箱")
   // @Pattern(regexp = "[1-9][0-9]{4,}@qq.com",message = "请输入正确qq邮箱")
    private String qqMail;
    @Pattern(regexp = "[\\u4e00-\\u9fa5]{2,6}",message = "请输入正确的省市!")
    //@NotEmpty(message = "请填所在地省市!")
    private String address;

    public Profile(){

    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    private Date create_time;

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getFiled1() {
        return filed1;
    }

    public void setFiled1(String filed1) {
        this.filed1 = filed1;
    }

    public String getFiled2() {
        return filed2;
    }

    public void setFiled2(String filed2) {
        this.filed2 = filed2;
    }

    public String getFiled3() {
        return filed3;
    }

    public void setFiled3(String filed3) {
        this.filed3 = filed3;
    }

    public String getFiled4() {
        return filed4;
    }

    public void setFiled4(String filed4) {
        this.filed4 = filed4;
    }

    public String getFiled5() {
        return filed5;
    }

    public void setFiled5(String filed5) {
        this.filed5 = filed5;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getEducation() {
        return education;
    }

    public void setEducation(String education) {
        this.education = education;
    }

    public String getHomeTown() {
        return homeTown;
    }

    public void setHomeTown(String homeTown) {
        this.homeTown = homeTown;
    }

    public String getOccupation() {
        return occupation;
    }

    public void setOccupation(String occupation) {
        this.occupation = occupation;
    }

    public String getQqMail() {
        return qqMail;
    }

    public void setQqMail(String qqMail) {
        this.qqMail = qqMail;
    }

    public Date getCreate_time() {
        return create_time;
    }

    public void setCreate_time(Date create_time) {
        this.create_time = create_time;
    }
}

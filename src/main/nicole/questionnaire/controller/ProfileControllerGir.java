package nicole.questionnaire.controller;

import nicole.questionnaire.domain.Answer;
import nicole.questionnaire.domain.AnswerList;
import nicole.questionnaire.domain.Mood;
import nicole.questionnaire.domain.Profile;
import nicole.questionnaire.service.AnswerService;
import nicole.questionnaire.service.MoodService;
import nicole.questionnaire.service.ProfileService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

/**
 * Created by Administrator on 2017/1/12.
 */

@Controller
public class ProfileControllerGir {

    private static Logger logger = LoggerFactory.getLogger(ProfileControllerGir.class);

    public static final int quetionCount = 3600;
    //每个用户回答题目数
    public static final int everyQueCount = 40;//90个人
    @Autowired
    private ProfileService profileService;

    @Autowired
    private MoodService moodService;
    @Autowired
    private AnswerService answerService;


    @RequestMapping(value = "/proPageGirl",method = RequestMethod.GET)
    public String toQuestionProfile(@ModelAttribute("profile") Profile profile){
        logger.info("input profile!");
       // model.addAttribute("uid",userId);//将uid传到前台页面，通过表单提交再传到/proPage POST方法中，最后插入数据库
        return "profile_girl";
    }

    @RequestMapping(value = "/profileProcessGirl",method = RequestMethod.POST)
    public String addProfile(@Validated Profile profile, BindingResult bindingResult,RedirectAttributes attr){
        if(bindingResult.hasErrors()){
            return "profile_girl";
        }

        //保存profile 这里的homeTown字段和表中的不匹配 表中是hometown，但是这里用hometown还是homeTown都可以，难道自动匹配大小写了？
       /* profileService.saveProfile("UPDATE profile SET field1 = ?,field2 = ?,field3 = ?,field4 = ?,field5 = ?,age = ?," +
                "education = ?,occupation = ?,qqMail=?,homeTown=?,address=? where uid="+uid,profile);*/

        int uid = profileService.saveProfile("insert into profile_girl(field1,field2,field3,field4,field5,gender,age,education,occupation,qqMail,homeTown,address" +
                ") values(?,?,?,?,?,?,?,?,?,?,?,?)",profile);//保存之后userId其实是0

        String field4 = profileService.selectOneFiled("select field4 from profile_girl WHERE uid="+uid);
        //model.addAttribute("profile",profile);
        if (field4.equals("0")){
            attr.addFlashAttribute("uid",uid);
            return "redirect:mood_question_girl";//对应的moodPage也要变成moodPage_girl
        }else
        {
            attr.addFlashAttribute("uid",uid);
            return "redirect:mood_question_aware_girl";
        }

    }
    @RequestMapping(value = "/mood_question_aware_girl",method = RequestMethod.GET)
    public String queMoodAware(@ModelAttribute("uid") int userId, ModelMap model){
        List<Mood> lists = moodService.selectMoodList(getquestion(userId));
        model.addAttribute("lists",lists);
        model.addAttribute("uid",userId);//将uid传到前台页面，通过表单提交再传到/mood_question POST方法中，最后插入数据库
        return "moodPageAware_girl";
    }

    @RequestMapping(value = "/mood_question_aware_girl",method = RequestMethod.POST)
    public String moodProcessAware(AnswerList answerList,RedirectAttributes attr) {
        List<Answer> answers = answerList.getAnswerList();

       //int[] array =  answerService.saveAnswer("INSERT INTO answer_girl(uid,mood_id,answer) VALUES(?,?,?)",answers);
       int[] array =  answerService.saveAnswer("INSERT INTO answer_girl(uid,mood_id,answer) VALUES(?,?,?)",answers);
        int uid = answers.get(0).getUserId();
        attr.addFlashAttribute("userId",uid);
        return "redirect:thanks";
    }
    @RequestMapping(value = "/thanks",method = RequestMethod.GET)
    public String endThanks(@ModelAttribute("userId") int userId,Model model){
        model.addAttribute("userId",userId);
        return "thankPage";

    }

    @RequestMapping(value = "/end",method = RequestMethod.GET)
    public String theEnd(){
        return "thankYou";
    }

    /*
    * 由于在moodPage中有form表单中的commandName="answer" 因此一定要在/mood_question处理的get方法中加@ModelAttribute("answer")
    * 或者不使用@ModelAttribute("answer")，直接model.addAttribute("answer",new Answer()) 再return "answer"
    * 如果将@ModelAttribute("answer")添加到/mood_question处理的post方法中则报
    * Neither BindingResult nor plain target object for bean name 'answer' available as request attribute
    * */
    @RequestMapping(value = "/mood_question_girl",method = RequestMethod.GET)
    public String queMood(@ModelAttribute("uid") int userId, ModelMap model){

        List<Mood> lists = moodService.selectMoodList(getquestion(userId));
        model.addAttribute("lists",lists);

        model.addAttribute("uid",userId);//将uid传到前台页面，通过表单提交再传到/mood_question POST方法中，最后插入数据库
        //model.addAttribute("answerList",new AnswerList());
        return "moodPage_girl";//moodPage 要变
    }



   @RequestMapping(value = "/mood_question_girl",method = RequestMethod.POST)
    public String moodProcess(AnswerList answerList,RedirectAttributes attr){

       List<Answer> answers = answerList.getAnswerList();

       answerService.saveAnswer("INSERT INTO answer_girl(uid,mood_id,answer) VALUES(?,?,?)",answers);

       int uid = answers.get(0).getUserId();
       attr.addFlashAttribute("userId",uid);
        return "redirect:thanks";
    }

    public String getquestion(int userId){

        int AllGroup = quetionCount/everyQueCount;
        int groupId = userId%AllGroup;
        int queryIndex = 0;
        //查询题库
        if(groupId==1){
            queryIndex = (groupId-1)*everyQueCount+1;
        }else {//当groupId为0的时候还是查询1-everyQueCount 相当于groupId为0和为1都是查询1-queryCount
            queryIndex = groupId*everyQueCount+1;
        }
        int queryIndexEnd = queryIndex+(everyQueCount-1);
        String querySql = "select * from mood_girl where mood_id between "+queryIndex+" and "+queryIndexEnd;//大坑 还可以使用limit A，B 但是B指的是查询多少条，不是从A查到B哭瞎
        return querySql;
    }



}

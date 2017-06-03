package nicole.questionnaire.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Created by xl on 2017/3/27.
 */
@Controller
public class MainController {
    private static Logger logger = LoggerFactory.getLogger(MainController.class);

    @RequestMapping(value = "/genderPage",method = RequestMethod.GET)
    public String toSex(){
        return "gender";

    }
    @RequestMapping(value = "/genderProcess",method = RequestMethod.POST)
    public String processSex(@RequestParam("sex") String sex){
        if (sex.equals("0")){//女
            return "redirect:proPageGirl";
        }else {
            return "redirect:proPage";
        }

    }

}

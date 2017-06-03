package nicole.questionnaire.utils;

/**
 * Created by Administrator on 2017/1/9.
 */
public class common {

    public static String getViewPath(String path) {
        return path != null && !path.trim().equals("")?"inxedu" + path:"";
    }
}

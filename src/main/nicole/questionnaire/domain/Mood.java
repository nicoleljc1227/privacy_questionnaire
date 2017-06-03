package nicole.questionnaire.domain;

/**
 * Created by Administrator on 2017/1/8.
 */
public class Mood {
    private int Mood_id;
    private String address;
    private String moodContent;
    private String publishTime;

    public Mood(){

    }
    public int getMood_id() {
        return Mood_id;
    }

    public void setMood_id(int mood_id) {
        Mood_id = mood_id;
    }

    public String getPublishTime() {
        return publishTime;
    }

    public void setPublishTime(String publishTime) {
        this.publishTime = publishTime;
    }

    public String getMoodContent() {
        return moodContent;
    }

    public void setMoodContent(String moodContent) {
        this.moodContent = moodContent;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}

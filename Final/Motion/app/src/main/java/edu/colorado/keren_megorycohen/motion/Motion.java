package edu.colorado.keren_megorycohen.motion;

/**
 * Created by kerenmegory-cohen on 5/2/17.
 */

public class Motion {
    private String name;
    private int imageResourceID;

    //constructor
    private Motion(int assign_image, String assign_name){
        this.imageResourceID = assign_image;
        this.name = assign_name;
    }

    public static final Motion[]outdoor = {
            new Motion(R.drawable.cardio, "Snowboarding"),
            new Motion(R.drawable.cardio, "Rock Climbing"),
            new Motion(R.drawable.cardio, "Snowshoeing"),
            new Motion(R.drawable.cardio, "Wake Boarding")
    };

    public static final Motion[]indoor = {
            new Motion(R.drawable.cardio, "Basketball"),
            new Motion(R.drawable.cardio, "Gymnastics"),
            new Motion(R.drawable.cardio, "Racketball"),
            new Motion(R.drawable.cardio, "Volleyball")
    };

    public int getImageResourceID(){
        return imageResourceID;
    }

    public String getName() {
        return name;
    }

    public String toString(){
        return this.name;
    }
}

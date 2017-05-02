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
            new Motion(R.drawable.snowboarding, "Snowboarding"),
            new Motion(R.drawable.rockclimbing, "Rock Climbing"),
            new Motion(R.drawable.snowshoeing, "Snowshoeing"),
            new Motion(R.drawable.wakeboarding, "Wakeboarding")
    };

    public static final Motion[]indoor = {
            new Motion(R.drawable.basketball, "Basketball"),
            new Motion(R.drawable.gymnastics, "Gymnastics"),
            new Motion(R.drawable.racketball, "Raquetball"),
            new Motion(R.drawable.volleyball, "Volleyball")
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

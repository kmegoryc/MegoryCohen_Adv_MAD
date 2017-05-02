package edu.colorado.keren_megorycohen.motion;

import android.app.Activity;
import android.os.Bundle;
import android.widget.ImageView;
import android.widget.TextView;

public class ActivityDetails extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_details);

        //get structure data from the intent
        int motionID = (Integer)getIntent().getExtras().get("activityid");
        String motionType = (String)getIntent().getExtras().get("activitycategory");

        //Structure instance
        Motion motion;

        //set correct structure instance based on
        switch(motionType){
            case "Indoor":
                motion = Motion.indoor[motionID];
                break;
            case "Outdoor":
                motion = Motion.outdoor[motionID];
                break;
            default:
                motion = Motion.indoor[motionID];
        }

        //populate name
        TextView structureName = (TextView)findViewById(R.id.activity_name);
        structureName.setText(motion.getName());

        //populate image
        ImageView lobeImage = (ImageView)findViewById(R.id.activityImageView);
        lobeImage.setImageResource(motion.getImageResourceID());

    }
}

package edu.colorado.keren_megorycohen.motion;

import android.app.ActionBar;
import android.app.Activity;
import android.os.Bundle;

public class SignUp extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_sign_up);

        //get reference to action bar
        ActionBar actionBar = getActionBar();

        //enable the up button
        actionBar.setDisplayHomeAsUpEnabled(true);

    }
}

package edu.colorado.keren_megorycohen.brain;

import android.app.ActionBar;
import android.app.Activity;
import android.os.Bundle;
import android.webkit.WebView;

public class LearnActivity extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_learn);

        //get reference to action bar
        ActionBar actionBar = getActionBar();

        //enable the up button
        actionBar.setDisplayHomeAsUpEnabled(true);

        WebView myWebView = (WebView) findViewById(R.id.learnWebView);
        myWebView.loadUrl("https://www.kenhub.com/en/quizzes/medial-view-of-the-brain");


    }
}

package edu.colorado.keren_megorycohen.motion;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ListView;

public class MainActivity extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        //create listener
        AdapterView.OnItemClickListener itemClickListener = new AdapterView.OnItemClickListener() {
            public void onItemClick(AdapterView<?> listView, View view, int position, long id) {
                String activity_string = (String) listView.getItemAtPosition(position);
                //create new intent
                Intent intent = new Intent(MainActivity.this, SpecificActivities.class);

                //add activity to intent
                intent.putExtra("activity", activity_string);

                //start intent
                startActivity(intent);
            }
        };
        //get the list view
        ListView listview = (ListView) findViewById(R.id.listView);

        //add listener to the list view
        listview.setOnItemClickListener(itemClickListener);
    }
}

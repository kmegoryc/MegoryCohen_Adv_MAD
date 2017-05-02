package edu.colorado.keren_megorycohen.motion;

import android.app.ListActivity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.ListView;

public class SpecificActivities extends ListActivity {

    private String activity_category;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        //create new intent
        Intent i = getIntent();
        activity_category = i.getStringExtra("activity");

        //get the list view
        ListView listStructures = getListView();

        //define an array adapter
        ArrayAdapter<Motion> listAdapter;

        //initialize the array adapter with the list of lobes
        switch(activity_category){
            case "Indoor":
                listAdapter = new ArrayAdapter<Motion>(this, android.R.layout.simple_list_item_1, Motion.indoor);
                break;
            case "Outdoor":
                listAdapter = new ArrayAdapter<Motion>(this, android.R.layout.simple_list_item_1, Motion.outdoor);
                break;
            default:
                listAdapter = new ArrayAdapter<Motion>(this, android.R.layout.simple_list_item_1, Motion.indoor);
        }
        listStructures.setAdapter(listAdapter);
    }

    @Override
    public void onListItemClick(ListView listView, View view, int position, long id){
        Intent intent = new Intent(SpecificActivities.this, ActivityDetails.class);
        intent.putExtra("activityid", (int) id);
        intent.putExtra("activitycategory", activity_category);
        startActivity(intent);
    }
}

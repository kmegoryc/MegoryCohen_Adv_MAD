package edu.colorado.keren_megorycohen.brain;

import android.app.ListActivity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.ListView;

public class LobeCategoryActivity extends ListActivity {

    private String lobe_name;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        //create new intent
        Intent i = getIntent();
        lobe_name = i.getStringExtra("lobe");

        //get the list view
        ListView listStructures = getListView();

        //define an array adapter
        ArrayAdapter<Structure> listAdapter;

        //initialize the array adapter with the list of lobes
        switch(lobe_name){
            case "Frontal Lobe":
                listAdapter = new ArrayAdapter<Structure>(this, android.R.layout.simple_list_item_1, Structure.frontal);
                break;
            case "Parietal Lobe":
                listAdapter = new ArrayAdapter<Structure>(this, android.R.layout.simple_list_item_1, Structure.parietal);
                break;
            case "Occipital Lobe":
                listAdapter = new ArrayAdapter<Structure>(this, android.R.layout.simple_list_item_1, Structure.occipital);
                break;
            case "Temporal Lobe":
                listAdapter = new ArrayAdapter<Structure>(this, android.R.layout.simple_list_item_1, Structure.temporal);
                break;
            default:
                listAdapter = new ArrayAdapter<Structure>(this, android.R.layout.simple_list_item_1, Structure.frontal);
        }
        listStructures.setAdapter(listAdapter);
    }

    @Override
    public void onListItemClick(ListView listView, View view, int position, long id){
        Intent intent = new Intent(LobeCategoryActivity.this, StructureActivity.class);
        intent.putExtra("structureid", (int) id);
        intent.putExtra("structuretype", lobe_name);
        startActivity(intent);
    }


}

package edu.colorado.keren_megorycohen.brain;

import android.app.Activity;
import android.os.Bundle;
import android.widget.ImageView;
import android.widget.TextView;

public class StructureActivity extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_structure);

        //get structure data from the intent
        int structureID = (Integer)getIntent().getExtras().get("structureid");
        String structureType = (String)getIntent().getExtras().get("structuretype");

        //Structure instance
        Structure structure;
        //set correct structure instance based on
        switch(structureType){
            case "Frontal":
                structure = Structure.frontal[structureID];
                break;
            case "Parietal":
                structure = Structure.parietal[structureID];
                break;
            case "Occipital":
                structure = Structure.occipital[structureID];
                break;
            case "Temporal":
                structure = Structure.temporal[structureID];
                break;
            default:
                structure = Structure.frontal[structureID];
        }

        //populate name
        TextView structureName = (TextView)findViewById(R.id.structure_name);
        structureName.setText(structure.getName());

        //populate image
        ImageView lobeImage = (ImageView)findViewById(R.id.lobeImageView);
        lobeImage.setImageResource(structure.getImageResourceID());

        //populate details

        TextView structureDetails = (TextView)findViewById(R.id.structure_details);
        structureDetails.setText(structure.getDetails());



    }
}

package edu.colorado.keren_megorycohen.ember;

import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.ProgressBar;
import android.widget.TextView;

import static edu.colorado.keren_megorycohen.ember.Day.alldata;

/*
 * Created by kerenmegory-cohen on 4/17/17.
 */

public class Overview extends Fragment {


    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, Bundle savedInstanceState) {
        return inflater.inflate(R.layout.overview, container, false);
    }

    @Override
    public void onStart() {
        super.onStart();
        View view = getView();

        /*//add on click listener to cigarette button
        Button addButton = (Button) view.findViewById(R.id.button);
        addButton.setOnClickListener(this);*/

        Button button = (Button) view.findViewById(R.id.button);

        button.setOnClickListener(new OnClickListener()
        {
            public void onClick(View v)
            {
                //call add cigarette function to update object
                addCigarette();
            }
        });

        //set text
        TextView limit = (TextView) view.findViewById(R.id.limit);
        limit.setText(String.valueOf(alldata.get(alldata.size()-1).getLimit()));

        TextView smoked = (TextView) view.findViewById(R.id.smoked);
        smoked.setText(String.valueOf(alldata.get(alldata.size()-1).getSmoked()));

        TextView remaining = (TextView) view.findViewById(R.id.remaining);
        remaining.setText(String.valueOf(alldata.get(alldata.size()-1).getRemaining()));

        //set date
        TextView date = (TextView) view.findViewById(R.id.date);
        date.setText(String.valueOf(alldata.get(alldata.size()-1).getMonth()) + "/" + String.valueOf(alldata.get(alldata.size()-1).getDay_of_month()) + "/" + String.valueOf(alldata.get(alldata.size()-1).getYear()));

        //set progress bar
        ProgressBar progress = (ProgressBar) view.findViewById(R.id.progressBar);
        progress.setProgress(0);
        //calculate percentage
        progress.setProgress((alldata.get(alldata.size()-1).getSmoked()/alldata.get(alldata.size()-1).getLimit())*100);
    }

    public void addCigarette() {

        //update smoked value
        alldata.get(alldata.size()-1).updateSmoked();
        //print last item of array (should be today)
        Log.d("alldataafter", String.valueOf(alldata.get(alldata.size()-1).getLimit()));
        Log.d("alldataafter", String.valueOf(alldata.get(alldata.size()-1).getSmoked()));
        Log.d("alldataafter", String.valueOf(alldata.get(alldata.size()-1).getRemaining()));
    }
}


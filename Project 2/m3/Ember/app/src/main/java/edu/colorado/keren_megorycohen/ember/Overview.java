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

import java.util.Calendar;

import static edu.colorado.keren_megorycohen.ember.Day.alldata;

/*
 * Created by kerenmegory-cohen on 4/17/17.
 */

public class Overview extends Fragment {

    //global calendar variable
    Calendar timeAtLast = Calendar.getInstance();

    double packCost = 5.51;
    double packSize = 20;

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, Bundle savedInstanceState) {
        return inflater.inflate(R.layout.overview, container, false);
    }

    @Override
    public void onStart() {
        super.onStart();
        View view = getView();

        Button button = (Button) view.findViewById(R.id.button);

        button.setOnClickListener(new OnClickListener()
        {
            public void onClick(View v)
            {
                //call add cigarette function to update object
                addCigarette();
            }
        });

        //update overview
        updateOverview(view);

        //set date
        TextView date = (TextView) view.findViewById(R.id.date);
        date.setText(String.valueOf(alldata.get(alldata.size()-1).getMonth()) + "/" + String.valueOf(alldata.get(alldata.size()-1).getDay_of_month()) + "/" + String.valueOf(alldata.get(alldata.size()-1).getYear()));

        //update time since last
        calcAndUpdateTimeSinceLast(view);

        //update average daily intake
        calcAndUpdateAvgDailyIntake(view);

        //update money saved
        calcAndUpdateMoneySaved(view);

        //update progress bar
        calcAndUpdateProgressBar(view);


    }

    public void addCigarette() {

        View view = getView();

        //update smoked value
        alldata.get(alldata.size()-1).updateSmoked();

        //store current time (time at last cigarette)
        timeAtLast = Calendar.getInstance();

        //update overview values
        updateOverview(view);

        //update time since last
        calcAndUpdateTimeSinceLast(view);

        //update average daily intake
        calcAndUpdateAvgDailyIntake(view);

        //update money saved
        calcAndUpdateMoneySaved(view);

        //update progress bar
        calcAndUpdateProgressBar(view);

        //store all values
        /*for(int i = 0; i < alldata.size()-1; i++){
            alldata.get(i).storeDays(getActivity(), alldata.size()-1);
        }*/

        //print last item of array (should be today)
        Log.d("alldataafter", String.valueOf(alldata.get(alldata.size()-1).getLimit()));
        Log.d("alldataafter", String.valueOf(alldata.get(alldata.size()-1).getSmoked()));
        Log.d("alldataafter", String.valueOf(alldata.get(alldata.size()-1).getRemaining()));
    }

    public void calcAndUpdateTimeSinceLast(View view) {

        //time since last cigarette = current time - time at last cigarette
        Calendar currentTime = Calendar.getInstance();
        long diff = currentTime.getTimeInMillis() - timeAtLast.getTimeInMillis();

        long minutes = diff / (1000 * 60);
        long hours = diff / (1000 * 60 * 60);
        long days = diff / (24 * 60 * 60 * 1000);

        //set stats text
        TextView last_cigarette = (TextView) view.findViewById(R.id.last_cigarette);
        last_cigarette.setText("Last Cigarette\n" + String.valueOf(days) + "d " + String.valueOf(hours) + "h " + String.valueOf(minutes) + "m");
    }

    public void updateOverview(View view) {

        //define overview text
        TextView limit = (TextView) view.findViewById(R.id.limit);
        TextView smoked = (TextView) view.findViewById(R.id.smoked);
        TextView remaining = (TextView) view.findViewById(R.id.remaining);
        //set overview text
        limit.setText(String.valueOf(alldata.get(alldata.size()-1).getLimit()));
        smoked.setText(String.valueOf(alldata.get(alldata.size()-1).getSmoked()));
        remaining.setText(String.valueOf(alldata.get(alldata.size()-1).getRemaining()));
    }

    public void calcAndUpdateAvgDailyIntake(View view) {

        //average daily intake = day.smoked for the past 7 days
        int sum = 0;
        float avg = 0;
        int count = 0;
        for (int i = alldata.size()-1; i > alldata.size()-7; i--){
            count+=1;
            sum = sum + alldata.get(i).getSmoked();
        }
        avg = sum/count;

        //set text
        TextView avg_daily_intake = (TextView) view.findViewById(R.id.avg_daily_intake);
        avg_daily_intake.setText("Average Daily Intake\n" + String.valueOf(avg));
    }

    public void calcAndUpdateMoneySaved(View view) {

        //money saved = alldata.remaining * (packcost/packsize)

        double remaining = 0;
        double saved = 0;
        for (int i = 0; i < alldata.size()-1; i++){
            remaining = remaining + alldata.get(i).getRemaining();
        }
        saved = remaining * (packCost/packSize);

        //set text
        TextView money_saved = (TextView) view.findViewById(R.id.money_saved);
        money_saved.setText("Money Saved\n" + "$" + String.format("%.2g%n", saved));
    }

    public void calcAndUpdateProgressBar(View view) {

        //set progress bar
        ProgressBar progress = (ProgressBar) view.findViewById(R.id.progressBar);

        int smoked = alldata.get(alldata.size()-1).getSmoked();
        int limit = alldata.get(alldata.size()-1).getLimit();
        float result = (float) smoked/limit;
        float finalresult = result*100;
        Log.d("progress", String.valueOf(smoked));
        Log.d("progress", String.valueOf(limit));
        Log.d("progress", String.valueOf((float) smoked/limit));
        //calculate percentage
        progress.setProgress((int) finalresult);
    }
}


package edu.colorado.keren_megorycohen.ember;

import java.util.ArrayList;

/**
 * Created by kerenmegory-cohen on 4/24/17.
 */

public class Day {

    //user-specific data
    private int limit;
    private int smoked;
    private int remaining;

    //date
    private int day_of_month;
    private int month;
    private int year;
    private boolean current_added;

    //constructor
    public Day(int new_limit, int new_smoked, int new_day_of_month, int new_month, int new_year){
        this.limit = new_limit;
        this.smoked = new_smoked; //initialize to 0 smoked
        this.remaining = new_limit - new_smoked; //initialize to limit remaining (limit - 0 = limit)

        this.day_of_month = new_day_of_month;
        this.month = new_month;
        this.year = new_year;
    }

    //create a public array of Day type elements (with test data)
    public static final ArrayList<Day> alldata = new ArrayList<Day>(){
        {
            add(new Day(20, 19, 19, 4, 2017));
            add(new Day(20, 18, 20, 4, 2017));
            add(new Day(20, 20, 21, 4, 2017));
            add(new Day(20, 22, 22, 4, 2017));
            add(new Day(20, 10, 23, 4, 2017));
        }
    };

    public int getLimit() {
        return limit;
    }

    public int getSmoked() {
        return smoked;
    }

    public void updateSmoked() {
        this.smoked += 1;
    }

    public int getRemaining() {
        //update remaining
        this.remaining = this.limit - this.smoked;
        return remaining;
    }

    public int getDay_of_month(){
        return day_of_month;
    }

    public int getMonth() {
        return month;
    }

    public int getYear() {
        return year;
    }
}

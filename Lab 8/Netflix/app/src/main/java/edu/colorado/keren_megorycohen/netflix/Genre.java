package edu.colorado.keren_megorycohen.netflix;

import android.content.Context;
import android.content.SharedPreferences;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by kerenmegory-cohen on 4/22/17.
 */

public class Genre {

    //string to store genre category
    private String genre;

    //array of strings to store movie titles
    private ArrayList<String> movies = new ArrayList<>();

    //constructor
    private Genre(String new_genre, ArrayList<String> new_movies){
        this.genre = new_genre;
        this.movies = new ArrayList<String>(new_movies);
    }

    //pre-create array of Genre objects
    /*public static final Genre[] netflix = {
            new Genre("Horror", new ArrayList<String>(Arrays.asList("Scary Movie", "Paranormal Activity", "Psycho", "The Conjuring", "The Blaire Witch Project", "Sinister", "Insidious"))),
            new Genre("Comedy", new ArrayList<String>(Arrays.asList("Bruce Almighty", "You Don't Mess with the Zohan", "Half Baked", "The Hangover", "Anchorman", "Shaun of the Dead", "Sausage Party"))),
            new Genre("Action", new ArrayList<String>(Arrays.asList("The Avengers", "Die Hard", "Casino Royale", "Taken", "Raiders of the Lost Ark", "Star Wars: The Last Jedi", "The Matrix"))),
            new Genre("Romance", new ArrayList<String>(Arrays.asList("The Notebook", "Love Actually", "When Harry Met Sally", "Grease", "Sleepless in Seattle", "A Walk to Remember", "Dirty Dancing"))),
            new Genre("Thriller", new ArrayList<String>(Arrays.asList("Shutter Island", "The Silence of the Lambs", "Prisoners", "Zodiac", "The Departed", "Arrival", "The Butterfly Effect", "The Others")))
    };*/

    //pre-create array of Genre objects
    public static final Genre[] netflix = {
            new Genre("Horror", new ArrayList<String>()),
            new Genre("Comedy", new ArrayList<String>()),
            new Genre("Action", new ArrayList<String>()),
            new Genre("Romance", new ArrayList<String>()),
            new Genre("Thriller", new ArrayList<String>())
    };

    public void storeHeroes(Context context, long universeId){
        //get access to a shared preferences file
        SharedPreferences sharedPrefs = context.getSharedPreferences("Superheroes", Context.MODE_PRIVATE);
        //create an editor to write to the shared preferences file
        SharedPreferences.Editor editor = sharedPrefs.edit();
        //create a set
        Set<String> set = new HashSet<String>();
        //add heroes to the set
        set.addAll(netflix[(int) universeId].getMovies());
        //pass the key/value pair to the shared preference file
        editor.putStringSet(netflix[(int) universeId].getGenre(), set);
        //save changes
        editor.commit();
    }

    public void loadMovies(Context context, int genreId){
        //get access to a shared preferences file
        SharedPreferences sharedPrefs = context.getSharedPreferences("Superheroes", Context.MODE_PRIVATE);
        //create an editor to read from the shared preferences file
        SharedPreferences.Editor editor = sharedPrefs.edit();
        //create a set with the hero list
        Set<String> set =sharedPrefs.getStringSet(netflix[genreId].getGenre(), null);
        //if there was a saved list add it to the heroes array
        if (set != null){
            Genre.netflix[genreId].movies.addAll(set);
        }
        //if no hero list was saved, use the defaults
        else {
            switch (genreId) {
                case 0:
                    Genre.netflix[0].movies.addAll(Arrays.asList("Scary Movie", "Paranormal Activity", "Psycho", "The Conjuring", "The Blaire Witch Project", "Sinister", "Insidious"));
                    break;
                case 1:
                    Genre.netflix[1].movies.addAll(Arrays.asList("Bruce Almighty", "You Don't Mess with the Zohan", "Half Baked", "The Hangover", "Anchorman", "Shaun of the Dead", "Sausage Party"));
                    break;
                case 2:
                    Genre.netflix[2].movies.addAll(Arrays.asList("The Avengers", "Die Hard", "Casino Royale", "Taken", "Raiders of the Lost Ark", "Star Wars: The Last Jedi", "The Matrix"));
                    break;
                case 3:
                    Genre.netflix[3].movies.addAll(Arrays.asList("The Notebook", "Love Actually", "When Harry Met Sally", "Grease", "Sleepless in Seattle", "A Walk to Remember", "Dirty Dancing"));
                    break;
                case 4:
                    Genre.netflix[4].movies.addAll(Arrays.asList("Shutter Island", "The Silence of the Lambs", "Prisoners", "Zodiac", "The Departed", "Arrival", "The Butterfly Effect", "The Others"));
                    break;
                default:
                    break;
            }
        }
    }

    public String getGenre() {
        return genre;
    }

    public ArrayList<String> getMovies() {
        return movies;
    }

    public String toString(){
        return this.genre;
    }

}

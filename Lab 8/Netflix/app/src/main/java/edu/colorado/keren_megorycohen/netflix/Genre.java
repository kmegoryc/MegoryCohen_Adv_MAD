package edu.colorado.keren_megorycohen.netflix;

import java.util.ArrayList;
import java.util.Arrays;

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
    public static final Genre[] netflix = {
            new Genre("Horror", new ArrayList<String>(Arrays.asList("Scary Movie", "Paranormal Activity", "Psycho", "The Conjuring", "The Blaire Witch Project", "Sinister", "Insidious"))),
            new Genre("Comedy", new ArrayList<String>(Arrays.asList("Bruce Almighty", "You Don't Mess with the Zohan", "Half Baked", "The Hangover", "Anchorman", "Shaun of the Dead", "Sausage Party"))),
            new Genre("Action", new ArrayList<String>(Arrays.asList("The Avengers", "Die Hard", "Casino Royale", "Taken", "Raiders of the Lost Ark", "Star Wars: The Last Jedi", "The Matrix"))),
            new Genre("Romance", new ArrayList<String>(Arrays.asList("The Notebook", "Love Actually", "When Harry Met Sally", "Grease", "Sleepless in Seattle", "A Walk to Remember", "Dirty Dancing"))),
            new Genre("Thriller", new ArrayList<String>(Arrays.asList("Shutter Island", "The Silence of the Lambs", "Prisoners", "Zodiac", "The Departed", "Arrival", "The Butterfly Effect", "The Others")))
    };

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

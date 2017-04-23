package edu.colorado.keren_megorycohen.netflix;

import android.app.Activity;
import android.os.Bundle;
import android.view.View;

public class DetailActivity extends Activity implements MovieListFragment.ButtonClickListener{

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_detail);

        //get reference to the movie detail fragment
        MovieListFragment genreDetailFragment = (MovieListFragment) getFragmentManager().findFragmentById(R.id.fragment_container);
        //get the id passed in the intent
        int genreId = (int) getIntent().getExtras().get("id");
        //pass the universe id to the fragment
        genreDetailFragment.setGenre(genreId);
    }

    @Override
    public void addmovieclicked(View view){
        MovieListFragment fragment = (MovieListFragment)getFragmentManager().findFragmentById(R.id.fragment_container);
        fragment.addMovie();
    }
}

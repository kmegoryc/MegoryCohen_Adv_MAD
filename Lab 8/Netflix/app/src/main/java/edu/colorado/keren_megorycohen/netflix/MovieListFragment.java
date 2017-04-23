package edu.colorado.keren_megorycohen.netflix;


import android.app.Dialog;
import android.app.Fragment;
import android.content.Context;
import android.os.Bundle;
import android.view.ContextMenu;
import android.view.LayoutInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListView;

import java.util.ArrayList;


/**
 * A simple {@link Fragment} subclass.
 */
public class MovieListFragment extends Fragment implements View.OnClickListener{

    //create array adapter to be later used to populate movie list
    private ArrayAdapter<String> adapter;

    private long genreId; //variable to store the genre id chosen

    //used to set genre id
    public void setGenre(long id) {
        this.genreId = id;
    }

    //create interface
    interface ButtonClickListener{
        void addmovieclicked(View view);
    }

    //create listener
    private ButtonClickListener listener;

    @Override public void onClick(View view){
        if (listener !=null){
        listener.addmovieclicked(view); }
    }

    @Override public void onAttach(Context context){
        super.onAttach(context);
        //attaches the context to the listener
        listener = (ButtonClickListener)context;
    }

    public MovieListFragment() {
        // Required empty public constructor
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {

        if (savedInstanceState !=null){
            genreId = savedInstanceState.getLong("genreId");
        }

        //if the hero list is empty, load heroes
        if (Genre.netflix[0].getMovies().size() == 0 ) {
            Genre.netflix[0].loadMovies(getActivity(), 0);
        }
        if (Genre.netflix[1].getMovies().size() == 0 ) {
            Genre.netflix[1].loadMovies(getActivity(), 1);
        }
        if (Genre.netflix[2].getMovies().size() == 0 ) {
            Genre.netflix[2].loadMovies(getActivity(), 2);
        }
        if (Genre.netflix[3].getMovies().size() == 0 ) {
            Genre.netflix[3].loadMovies(getActivity(), 3);
        }
        if (Genre.netflix[4].getMovies().size() == 0 ) {
            Genre.netflix[4].loadMovies(getActivity(), 4);
        }

        // Inflate the layout for this fragment
        return inflater.inflate(R.layout.fragment_movie_list, container, false);
    }

    @Override public void onSaveInstanceState(Bundle savedInstanceState){
        savedInstanceState.putLong("genreId", genreId);
    }

    @Override
    public void onStart() {
        super.onStart();
        View view = getView();

        //get list view
        ListView listMovies = (ListView) view.findViewById(R.id.movieListView);
        ArrayList<String> movielist = new ArrayList<String>();

        //set array list to first item in netflix array
        movielist = Genre.netflix[(int) genreId].getMovies();

        //set array adapter
        adapter = new ArrayAdapter<String>(getActivity(), android.R.layout.simple_list_item_1, movielist);

        //bind array adapter to list view
        listMovies.setAdapter(adapter);

        Button addButton = (Button) view.findViewById(R.id.addButton);
        addButton.setOnClickListener(this);

        //register context menu
        registerForContextMenu(listMovies);

    }

    @Override
    public void onCreateContextMenu(ContextMenu menu, View view, ContextMenu.ContextMenuInfo menuInfo){
        super.onCreateContextMenu(menu, view, menuInfo);
        //cast ContextMenu.ContextMenuInfo to AdapterView.AdapterContextMenuInfo since we're using an adapter
        AdapterView.AdapterContextMenuInfo adapterContextMenuInfo = (AdapterView.AdapterContextMenuInfo) menuInfo;
        //get movie name that was pressed
        String moviename = adapter.getItem(adapterContextMenuInfo.position); //set the menu title
        menu.setHeaderTitle("Delete " + moviename);
        //add the choices to the menu
        menu.add(1, 1, 1, "Yes");
        menu.add(2, 2, 2, "No");
    }

    @Override public boolean onContextItemSelected(MenuItem item){
        //get the id of the item
        int itemId = item.getItemId();
        if (itemId == 1) { //if yes menu item was pressed
            //get the position of the menu item
            AdapterView.AdapterContextMenuInfo info = (AdapterView.AdapterContextMenuInfo) item.getMenuInfo();
            //remove the movie
            Genre.netflix[(int) genreId].getMovies().remove(info.position);
            //refresh the list view
            MovieListFragment.this.adapter.notifyDataSetChanged();
            Genre.netflix[(int) genreId].storeHeroes(getActivity(), genreId);
        }
        return true;
    }

    public void addMovie(){
        final Dialog dialog = new Dialog(getActivity());
        dialog.setContentView(R.layout.dialog);
        dialog.setTitle("Add Movie");
        dialog.setCancelable(true);
        final EditText editText = (EditText) dialog.findViewById(R.id.editTextMovie);
        Button button = (Button) dialog.findViewById(R.id.addButton);
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String movieName = editText.getText().toString();
                // add movie
                Genre.netflix[(int) genreId].getMovies().add(movieName);
                MovieListFragment.this.adapter.notifyDataSetChanged();
                Genre.netflix[(int) genreId].storeHeroes(getActivity(), genreId);
                dialog.dismiss();
            }
        });
        dialog.show();
    }

}

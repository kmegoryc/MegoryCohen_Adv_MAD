package edu.colorado.keren_megorycohen.netflix;


import android.app.Fragment;
import android.content.Context;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ListView;


/**
 * A simple {@link Fragment} subclass.
 */
public class GenreListFragment extends Fragment implements AdapterView.OnItemClickListener{

    //create interface
    interface GenreListListener{
        void itemClicked(long id);
    }

    //create listener
    private GenreListListener listener;

    @Override public void onAttach(Context context){
        super.onAttach(context);
        //attaches the context to the listener
        listener = (GenreListListener) context;
    }

    @Override public void onItemClick(AdapterView<?> parent, View view, int position, long id){
        if (listener != null){
        //tells the listener an item was clicked
        listener.itemClicked(id);
        }
    }

    public GenreListFragment() {
        // Required empty public constructor
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment
        return inflater.inflate(R.layout.fragment_genre_list, container, false);
    }

    @Override
    public void onStart(){
        super.onStart();
        View view = getView();
        //load data into fragment
        if (view != null) {
            //get the list view
            ListView listGenre = (ListView) view.findViewById(R.id.listView);
            //set array adapter as netflix array of Genre type
            ArrayAdapter<Genre> listAdapter = new ArrayAdapter<Genre>(
                    getActivity(), android.R.layout.simple_list_item_1, Genre.netflix);

            //set the array adapter on the list view
            listGenre.setAdapter(listAdapter);

            //attach the listener to the list view
            listGenre.setOnItemClickListener(this);

        }
    }

}

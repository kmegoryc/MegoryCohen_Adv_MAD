package edu.colorado.keren_megorycohen.brain;

/**
 * Created by kerenmegory-cohen on 4/16/17.
 */

public class Structure {
    private String name;
    private String details;
    private int imageResourceID;

    //constructor
    private Structure(int assign_image, String assign_name, String assign_details){
        this.imageResourceID = assign_image;
        this.name = assign_name;
        this.details = assign_details;
    }

    public static final Structure[]frontal = {
            new Structure(R.drawable.frontal, "Medial frontal lobe", "This region contains the cingulate gyrus, which is a part of the limbic system. It also contains the superior frontal gyrus, which research suggests plays a role in self-awareness."),
            new Structure(R.drawable.frontal, "Lateral frontal lobe", "This region contains the superior frontal gyrus, which aids in self-awareness, as well as the middle frontal and inferior frontal gyrus. The inferior frontal gyrus plays a role in language processing."),
            new Structure(R.drawable.frontal, "Polar region", "This region is home to the frontomarginal gyrus, as well as the transverse frontopolar gyri.")
    };

    public static final Structure[]occipital = {
            new Structure(R.drawable.occipital, "Brodmann area 17", "Known as V1, this region is located in the occipital lobe's calcarine sulcus, and serves as the brain's primary visual cortex. It aids the brain to determine location, spatial information, and color data."),
            new Structure(R.drawable.occipital, "The ventral stream", "Known sometimes as V2, this is a secondary visual cortex that helps the brain assign meaning to what it is seeing. Without V2, you would still be able to see, but would have no conscious awareness of or understanding of the sights your eyes took in."),
            new Structure(R.drawable.occipital, "The dorsomedial stream", "Neuroscientists don't yet have a strong understanding of this brain region, which connects to both V1 and V2, as well as other brain regions.\n"),
            new Structure(R.drawable.occipital, "The lateral geniculate bodies", "These structures take in optic information from retinal sensors in each eye, sending raw information to each visual cortex.\n"),
            new Structure(R.drawable.occipital, "Lingula", "This area receives information from the contralateral inferior retina to gather information about the field of vision.")
    };

    public static final Structure[]parietal = {
            new Structure(R.drawable.parietal, "Postcentral gyrus", "This region is the brain's primary somatosensory cortex, and maps sensory information onto what is known as a sensory homonculus. Some researchers also refer to this region as Brodmann area 3."),
            new Structure(R.drawable.parietal, "Posterior parietal cortex", "This region is thought to play a vital role in coordinating movement and spatial reasoning. It also plays a role in attention, particularly attention driven by new stimuli, such as when an animal jumps into the road while you are driving."),
            new Structure(R.drawable.parietal, "Superior parietal lobule", "This region helps you determine your own orientation in space, as well as the orientation of other objects. It also receives significant input from the hand, suggesting that it helps coordinate fine motor skills and sensory input from the hands."),
            new Structure(R.drawable.parietal, "Inferior parietal lobule", " Sometimes called Gerschwind's territory, this region aids in assessing facial expressions for emotional content. Some research suggests it plays a role in other functions, including language processing, basic mathematical operations, and even body image. It contains a number of sub-regions, including the angular and supramarginal gyrus.")
    };

    public static final Structure[]temporal = {
            new Structure(R.drawable.temporal, "Limbic lobe", "This brain region actually intersects with several lobes, but interacts directly with the temporal lobe to influence the limbic system, including automatic emotional reactions such as the fight-or-flight response and the limbic system. The limbic lobe is home to key memory, learning, and attention processing structures such as the amygdala and hippocampus. This brain region also manages a number of automatic, unconscious bodily functions, as well as unconscious emotional states, such as sexual arousal and appetite."),
            new Structure(R.drawable.temporal, "Wernicke's area", "Region of the brain that contains motor neurons involved in the comprehension of speech. This area was first described in 1874 by German neurologist Carl Wernicke. The Wernicke area is located in the posterior third of the upper temporal convolution of the left hemisphere of the brain. Thus, it lies close to the auditory cortex. This area appears to be uniquely important for the comprehension of speech sounds and is considered to be the receptive language, or language comprehension, centre."),
            new Structure(R.drawable.temporal, "Broca's area", "Broca area, also called convolution of Broca, region of the brain that contains neurons involved in speech function. This area, located in the frontal part of the left hemisphere of the brain, was discovered in 1861 by French surgeon Paul Broca, who found that it serves a vital role in the generation of articulate speech.")
    };

    public int getImageResourceID(){
        return imageResourceID;
    }

    public String getName() {
        return name;
    }

    public String getDetails() {
        return details;
    }

    //the string representation of a tulip is its name
    public String toString(){
        return this.name;
    }

}



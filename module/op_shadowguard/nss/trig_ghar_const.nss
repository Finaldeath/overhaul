#include "help_general"

void main()
{
    object o = GetEnteringObject();

    if (GetTag(o) == "CT_COMM_GC_CONS")
    {
        string s = GetTag(OBJECT_SELF);

        s = GetStringRight(s, 1);

        switch (StringToInt(s))
        {
            case 1: s = "[The construct sets dutifully to cleaning the outside of the Academy walls...]";
                break;

            case 2: s = "[The construct leans down and slowly waters the tree before it...]";
                break;

            case 3: s = "[Utilizing its massive strength, the construct carries large amounts of materials across the district...]";
                break;
        }

        SceneSpeak(o, s);
    }
}

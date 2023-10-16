#include "help_general"

void main()
{
    object o = GetEnteringObject();

    if (GetTag(o) == "CT_COMM_BH_S0SP")
    {
        if (GetFirstTimeIn())
        {
            AssignCommand(o, ClearAllActions());

            SceneSpeak(o, "[The slaver slowly descends into the sewers...]");

            DestroyObject(o, 3.0);
        }
    }
}

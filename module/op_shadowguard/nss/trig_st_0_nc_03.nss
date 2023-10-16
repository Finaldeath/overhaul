#include "help_general"

void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
    {
        if (GetFirstTimeIn())
        {
            object oMalt = GetNearestObjectByTag("CT_UNIQ_PH_MALT", oPC);

            object oNC = GetNearestObjectByTag("CT_COMM_PH_MAN0", oMalt);

            if (GetIsEnemy(oPC, oMalt) == FALSE)
            {
                SceneSpeak(oMalt, "Where is that fool Halgok?!  I can't hold Tarin Lightfingers here forever!");

                DelayCommand(4.0, SceneSpeak(oNC, "Boss, looks like we got company...  maybe news from Halgok?"));
            }

            /*else
            {
                SceneSpeak(oMalt, "Halt, boys!  If this one's gotten so far into our lair, perhaps we'd fare better by talking this matter out...");

                AdjustReputation(oPC, OBJECT_SELF, 50);

                object o = GetFirstObjectInArea(GetArea(oPC));
                while (o != OBJECT_INVALID)
                {
                    AssignCommand(o, ClearAllActions());

                    o = GetNextObjectInArea();
                }
            } */
        }
    }
}

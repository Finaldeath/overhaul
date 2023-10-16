//::///////////////////////////////////////////////
//:: m1q3A Area Script: OnEnter
//:: m1q3A_Area_1
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Updates the journal with information about the zoo
    Updates if all animals safe, some dead, all dead.
*/
//:://////////////////////////////////////////////
//:: Created By: Luke Kristjanson
//:: Created On: April 24, 2002
//:://////////////////////////////////////////////

#include "NW_I0_Plot"
void main()
{

    object oPC = GetEnteringObject();
    int iZooState = GetLocalInt(oPC, "NW_JOURNAL_ENTRYm1q1_Zoo");
    if (GetIsPC(oPC))
    {
        //If on zoo plot
        if (iZooState > 0 && iZooState < 20)
        {
            //If animals ALL DEAD
            if (GetLocalInt(GetModule(),"NW_G_M1S5AnimalsKilled") >= 4)
            {
                AddJournalQuestEntry("m1q1_Zoo", 17, oPC);
            }
            //If SOME DEAD but NOT ALL
            if ((GetLocalInt(GetModule(),"NW_G_M1S5AnimalsRescued") +
                GetLocalInt(GetModule(),"NW_G_M1S5AnimalsKilled")) >= 4 &&
                GetLocalInt(GetModule(),"NW_G_M1S5AnimalsKilled") > 0 &&
                GetLocalInt(GetModule(),"NW_G_M1S5AnimalsKilled") < 4)
            {
                AddJournalQuestEntry("m1q1_Zoo", 15, oPC);
            }
            //If NONE DEAD
            if ((GetLocalInt(GetModule(),"NW_G_M1S5AnimalsRescued") +
                GetLocalInt(GetModule(),"NW_G_M1S5AnimalsKilled")) >= 4 &&
                GetLocalInt(GetModule(),"NW_G_M1S5AnimalsKilled") == 0)
            {
                AddJournalQuestEntry("m1q1_Zoo", 12, oPC);
            }
        }
    }

}

//::///////////////////////////////////////////////
//:: Name
//:: FileName
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Provides GP reward for return of one of the
    tomes of Imaskar. Increments corresponding
    journal entry.
*/
//:://////////////////////////////////////////////
//:: Created By: Unkown Scripter
//:: Created On: Unknown Date
//:: Last Modified By: Rob Bartel
//:: Last Modified On: Feb 21, 2002
//:://////////////////////////////////////////////

#include "NW_I0_PLOT"

void main()
{
    object oPC = GetPCSpeaker();

    RewardGP(500, GetPCSpeaker());
    RewardXP("m2q1_Imaskar",25,GetPCSpeaker());

    int iImaskarCount = GetLocalInt(OBJECT_SELF, "m2q1_ImaskarCount");
    int iNewCount = iImaskarCount+1;

    switch (iImaskarCount)
    {
        case 0:
        {
            AddJournalQuestEntry("m2q1_Imaskar", 20, oPC);
        }
        break;

        case 1:
        {
            AddJournalQuestEntry("m2q1_Imaskar", 30, oPC);
        }
        break;

        case 2:
        {
            AddJournalQuestEntry("m2q1_Imaskar", 40, oPC);
        }
        break;

        case 3:
        {
            AddJournalQuestEntry("m2q1_Imaskar", 50, oPC);
        }
        break;

        case 4:
        {
            AddJournalQuestEntry("m2q1_Imaskar", 60, oPC);
        }
        break;
    }

    SetLocalInt(OBJECT_SELF, "m2q1_ImaskarCount", iNewCount);

}

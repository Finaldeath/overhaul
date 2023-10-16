//::///////////////////////////////////////////////
//:: Temple of the Winds, Outer Sanctum (OnEnter)
//:: En_Winds_05.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Handle journal entry.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: April 6, 2003
//:://////////////////////////////////////////////

void main()
{
    //Only worry about the player's entry
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == TRUE)
    {
        //Only add the journal entry once
        int bDoOnce = GetLocalInt(OBJECT_SELF, "bDoOnce");
        if (bDoOnce == FALSE)
        {
            //Add journal entry.
            AddJournalQuestEntry("Journ_Temple_10", 1, oPC, TRUE, TRUE);

            //Flag the DoOnce
            SetLocalInt(OBJECT_SELF, "bDoOnce", TRUE);
        }
        //Give the player XP if they haven't already received it.
        int bXP = GetLocalInt(oPC, "XP_Main_01");
        if (bXP == FALSE)
        {
            SetLocalInt(oPC, "XP_Main_01", TRUE);
            int iXP = FloatToInt(GetJournalQuestExperience("Journ_Main_End") * 0.10);
            GiveXPToCreature(oPC, iXP);
        }
    }
}

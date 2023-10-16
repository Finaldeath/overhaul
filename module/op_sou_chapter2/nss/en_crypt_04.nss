//::///////////////////////////////////////////////
//:: Crypt Tower, Level 4 (OnEnter)
//:: En_Crypt_04.nss
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
            //AddJournalQuestEntry("Journ_Crypt_50", 1, oPC, TRUE, TRUE);

            //Flag the DoOnce
            SetLocalInt(OBJECT_SELF, "bDoOnce", TRUE);
        }

        //Signal the Dead Wind's initial VFX event
        SignalEvent(OBJECT_SELF, EventUserDefined(5015));
    }
}

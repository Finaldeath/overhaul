//::///////////////////////////////////////////////
//:: Crypt Tower, Level 3 (OnEnter)
//:: En_Crypt_03.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Fire a User-Defined Event when the player
     enters.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 13, 2003
//:://////////////////////////////////////////////

void main()
{
    //Only worry about the player's entry
    object oPC = GetEnteringObject();
    int bMazeOn = GetLocalInt(OBJECT_SELF, "bMazeOn");

    if (GetIsPC(oPC) == TRUE && bMazeOn == FALSE)
    {
        SetLocalInt(OBJECT_SELF, "bMazeOn", TRUE);
        SignalEvent(OBJECT_SELF, EventUserDefined(5001));

        //Only add the journal entry once
        int bDoOnce = GetLocalInt(OBJECT_SELF, "bDoOnce");
        if (bDoOnce == FALSE)
        {
            //Add journal entry.
            //AddJournalQuestEntry("Journ_Crypt_40", 1, oPC, TRUE, TRUE);

            //Flag the DoOnce
            SetLocalInt(OBJECT_SELF, "bDoOnce", TRUE);
        }
    }
}

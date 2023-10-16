//::///////////////////////////////////////////////
//:: Crypt Tower, Level 1 (OnEnter)
//:: En_Crypt_01.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Spawn a key into a random Sarcophagus.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: April 4, 2003
//:://////////////////////////////////////////////

void main()
{
    //Verify that it's a PC who's entering.
    object oPC = GetEnteringObject();
    int bDoOnce = GetLocalInt(OBJECT_SELF, "Key_DoOnce");
    if (GetIsPC(oPC) == TRUE && bDoOnce == FALSE)
    {
        //Flag the Do Once
        SetLocalInt(OBJECT_SELF, "Key_DoOnce", TRUE);

        //Pick one of the 8 Dread Sarcophagi at random
        int iRandom = Random(8)+1;
        object oDread = GetNearestObjectByTag("Dread_Sarcophagus", oPC, iRandom);

        //Add the key
        CreateItemOnObject("key_crypt_01", oDread);

        //Add journal entry.
        //AddJournalQuestEntry("Journ_Crypt_20", 1, oPC, TRUE, TRUE);
    }
}

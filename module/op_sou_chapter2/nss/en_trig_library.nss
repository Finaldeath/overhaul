//::///////////////////////////////////////////////
//:: Library Map Note Trigger (OnEnter)
//:: En_Trig_Library.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Activate the Great Library map note and give
     journal entry.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: April 6, 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetEnteringObject();
    int bDoOnce = GetLocalInt(OBJECT_SELF, "bDoOnce");
    if (GetIsPC(oPC) == TRUE && bDoOnce == FALSE)
    {
        //Handle DoOnce
        SetLocalInt(OBJECT_SELF, "bDoOnce", TRUE);
        //Enable Map Pin
        object oMapPin = GetNearestObjectByTag("TheGreatLibrary");
        SetMapPinEnabled(oMapPin, TRUE);
        //Add journal entry
        AddJournalQuestEntry("Journ_Library_10", 1, oPC, TRUE, TRUE);
        //Give XP to everyone
        object oPC_XP = GetFirstPC();
        while (oPC_XP != OBJECT_INVALID)
        {
            int bXP = GetLocalInt(oPC_XP, "XP_Library_01");
            if (bXP == FALSE)
            {
                SetLocalInt(oPC_XP, "XP_Library_01", TRUE);
                int iXP = FloatToInt(GetJournalQuestExperience("Journ_Library_End") * 0.10);
                GiveXPToCreature(oPC_XP, iXP);
            }
            oPC_XP = GetNextPC();
        }
    }
}

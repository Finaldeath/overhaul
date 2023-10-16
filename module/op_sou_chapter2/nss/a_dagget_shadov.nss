//::///////////////////////////////////////////////
//:: Dagget Filth (Action - Tell of Shadovar)
//:: A_Dagget_Shadov.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Handle journal entry & XP.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: April 10, 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    //DoOnce
    int bDoOnce = GetLocalInt(OBJECT_SELF, "bDoOnce");
    if (bDoOnce == FALSE)
    {
        //Add journal entry.
        //AddJournalQuestEntry("Journ_Wizard_20", 1, oPC, TRUE, TRUE);

        //Reward the XP
        object oPC_XP = GetFirstPC();
        while (oPC_XP != OBJECT_INVALID)
        {
            int bXP = GetLocalInt(oPC_XP, "XP_Wizard_02");
            if (bXP == FALSE)
            {
                SetLocalInt(oPC_XP, "XP_Wizard_02", TRUE);
                int iXP = FloatToInt(GetJournalQuestExperience("Journ_Wizard_End") * 0.10);
                GiveXPToCreature(oPC_XP, iXP);
            }
            oPC_XP = GetNextPC();
        }

        //Flag the DoOnce
        SetLocalInt(OBJECT_SELF, "bDoOnce", TRUE);
    }
}

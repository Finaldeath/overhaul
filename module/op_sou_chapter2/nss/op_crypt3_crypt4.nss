//::///////////////////////////////////////////////
//:: Door: Crypt3 to Crypt4 (OnOpen)
//:: Op_Crypt3_Crypt4.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Give XP.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: April 10, 2003
//:://////////////////////////////////////////////

void main()
{
    //Give XP to everyone
    object oPC_XP = GetFirstPC();
    while (oPC_XP != OBJECT_INVALID)
    {
        int bXP = GetLocalInt(oPC_XP, "XP_Crypt_06");
        if (bXP == FALSE)
        {
            SetLocalInt(oPC_XP, "XP_Crypt_06", TRUE);
            int iXP = FloatToInt(GetJournalQuestExperience("Journ_Crypt_End") * 0.10);
            GiveXPToCreature(oPC_XP, iXP);
        }
        oPC_XP = GetNextPC();
    }

    //Auto-save
    DoSinglePlayerAutoSave();
}

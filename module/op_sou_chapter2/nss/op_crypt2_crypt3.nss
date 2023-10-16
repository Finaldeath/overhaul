//::///////////////////////////////////////////////
//:: Door: Crypt2 to Crypt3 (OnOpen)
//:: Op_Crypt2_Crypt3.nss
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
        int bXP = GetLocalInt(oPC_XP, "XP_Crypt_04");
        if (bXP == FALSE)
        {
            SetLocalInt(oPC_XP, "XP_Crypt_04", TRUE);
            int iXP = FloatToInt(GetJournalQuestExperience("Journ_Crypt_End") * 0.10);
            GiveXPToCreature(oPC_XP, iXP);
        }
        oPC_XP = GetNextPC();
    }
}

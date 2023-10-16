//::///////////////////////////////////////////////
//:: Catching the Wise Wind (Action - Winter)
//:: A_Catch_Winter.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Declares the Winter map as the setting of
     the Wise Wind battle.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: April 30, 2003
//:://////////////////////////////////////////////

void main()
{
    SetLocalString(GetArea(OBJECT_SELF), "sWiseWindMap", "Winter");

    //Add journal entry
    object oPC = GetPCSpeaker();
    AddJournalQuestEntry("Journ_Library_110", 1, oPC, TRUE, TRUE);
    //Give XP to everyone
    object oPC_XP = GetFirstPC();
    while (oPC_XP != OBJECT_INVALID)
    {
        int bXP = GetLocalInt(oPC_XP, "XP_Library_11");
        if (bXP == FALSE)
        {
            SetLocalInt(oPC_XP, "XP_Library_11", TRUE);
            int iXP = FloatToInt(GetJournalQuestExperience("Journ_Library_End") * 0.14);
            GiveXPToCreature(oPC_XP, iXP);
        }
        oPC_XP = GetNextPC();
    }
    //Auto-Save
    DoSinglePlayerAutoSave();
}

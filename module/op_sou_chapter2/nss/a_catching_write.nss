//::///////////////////////////////////////////////
//:: The Catching of the Wind (Action - Write)
//:: A_Catching_Write.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Give out journal entry & XP
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: April 10, 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    //Add journal entry
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

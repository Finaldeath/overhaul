//::///////////////////////////////////////////////
//:: Tome (Action - Rewrite)
//:: A_Tome_Rewrite.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Flag the tome as being rewritten.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 14, 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    SetLocalInt(OBJECT_SELF, "bRewritten", TRUE);

    string sTag = GetTag(OBJECT_SELF);
    if (sTag == "RomanceNovel")
    {
        //Add journal entry
        //AddJournalQuestEntry("Journ_Library_70", 1, oPC, TRUE, TRUE);
        //Give XP to everyone
        object oPC_XP = GetFirstPC();
        while (oPC_XP != OBJECT_INVALID)
        {
            int bXP = GetLocalInt(oPC_XP, "XP_Library_07");
            if (bXP == FALSE)
            {
                SetLocalInt(oPC_XP, "XP_Library_07", TRUE);
                int iXP = FloatToInt(GetJournalQuestExperience("Journ_Library_End") * 0.05);
                GiveXPToCreature(oPC_XP, iXP);
            }
            oPC_XP = GetNextPC();
        }
    }
    if (sTag == "HellTreatise")
    {
        //Add journal entry
        //AddJournalQuestEntry("Journ_Library_90", 1, oPC, TRUE, TRUE);
        //Give XP to everyone
        object oPC_XP = GetFirstPC();
        while (oPC_XP != OBJECT_INVALID)
        {
            int bXP = GetLocalInt(oPC_XP, "XP_Library_09");
            if (bXP == FALSE)
            {
                SetLocalInt(oPC_XP, "XP_Library_09", TRUE);
                int iXP = FloatToInt(GetJournalQuestExperience("Journ_Library_End") * 0.05);
                GiveXPToCreature(oPC_XP, iXP);
            }
            oPC_XP = GetNextPC();
        }
    }
}

//::///////////////////////////////////////////////
//:: William Rey (Action - Joins)
//:: A_William_Joins.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Flag William as having joined the cause
     against the Wise Wind.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 14, 2003
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(GetModule(), "bWilliamJoins", TRUE);
    //Add journal entry.
    //AddJournalQuestEntry("Journ_Library_80", 1, oPC, TRUE, TRUE);
    //Give XP to everyone
    object oPC_XP = GetFirstPC();
    while (oPC_XP != OBJECT_INVALID)
    {
        int bXP = GetLocalInt(oPC_XP, "XP_Library_08");
        if (bXP == FALSE)
        {
            SetLocalInt(oPC_XP, "XP_Library_08", TRUE);
            int iXP = FloatToInt(GetJournalQuestExperience("Journ_Library_End") * 0.05);
            GiveXPToCreature(oPC_XP, iXP);
        }
        oPC_XP = GetNextPC();
    }
}

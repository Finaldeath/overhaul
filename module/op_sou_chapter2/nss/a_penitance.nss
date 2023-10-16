//::///////////////////////////////////////////////
//:: Karsus' Penitence (Action - Read)
//:: A_Penitance.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Jump the player to back to the Library area.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 14, 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    object oTarget = GetObjectByTag("Library_04_Library_01");

    //Give the player XP if they haven't already received it.
    int bXP = GetLocalInt(oPC, "XP_Library_06");
    if (bXP == FALSE)
    {
        SetLocalInt(oPC, "XP_Library_06", TRUE);
        int iXP = FloatToInt(GetJournalQuestExperience("Journ_Library_End") * 0.04);
        GiveXPToCreature(oPC, iXP);
    }

    AssignCommand(oPC, JumpToObject(oTarget));
}

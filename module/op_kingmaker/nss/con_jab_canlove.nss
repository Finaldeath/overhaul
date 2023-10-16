//::///////////////////////////////////////////////
//:: con_jab_canlove
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC is male and not on the Kaidala romance plot
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Nov 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oPC = GetFirstPC();
    iResult = GetGender(oPC)==GENDER_MALE
        && (GetLocalInt(oPC,"OS_KAI_ROMANCE")==0
        || GetLocalInt(oPC,"OS_KAI_ROMANCE")==99);
    return iResult;
}

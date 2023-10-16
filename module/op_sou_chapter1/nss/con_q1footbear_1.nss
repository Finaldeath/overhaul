//::///////////////////////////////////////////////
//:: Name: x1_chk_animempth
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Check to see if PC has Animal Empathy

*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 12/03
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    if (GetLocalInt(oPC, "X1_SavedQ1FootBear") == 1)
        return FALSE;
    if (GetSkillRank(SKILL_ANIMAL_EMPATHY, oPC) >= 1)
        return TRUE;

    return FALSE;
}

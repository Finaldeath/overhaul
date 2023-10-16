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
    if (GetSkillRank(SKILL_ANIMAL_EMPATHY, GetPCSpeaker()) >= 1)
        return TRUE;
    return FALSE;
}

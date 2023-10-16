//::///////////////////////////////////////////////
//:: Name q1_chk_curespell
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Check to see if PC has any useable healing talent
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 12/03
//:://////////////////////////////////////////////

int StartingConditional()
{
    talent tTalent = GetCreatureTalentBest(TALENT_CATEGORY_BENEFICIAL_HEALING_TOUCH, 20, GetPCSpeaker());
    if (GetIsTalentValid(tTalent) == TRUE)
        return TRUE;
    return FALSE;
}

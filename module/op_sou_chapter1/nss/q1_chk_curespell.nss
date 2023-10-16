//::///////////////////////////////////////////////
//:: Name q1_chk_curespell
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Check to see if PC has cure light or minor wounds memorized
    (or useable).
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 12/03
//:://////////////////////////////////////////////

int StartingConditional()
{
    if (GetHasSpell(SPELL_CURE_LIGHT_WOUNDS, GetPCSpeaker()) > 0 || GetHasSpell(SPELL_CURE_MINOR_WOUNDS, GetPCSpeaker()) > 0)
        return TRUE;
    return FALSE;
}

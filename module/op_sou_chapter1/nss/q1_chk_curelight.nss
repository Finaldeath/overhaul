//::///////////////////////////////////////////////
//:: Name q1_chk_curelight
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Check to see if PC has cure light wounds memorized
    (or useable).
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 12/03
//:://////////////////////////////////////////////

int StartingConditional()
{
    if (GetHasSpell(SPELL_CURE_LIGHT_WOUNDS, GetPCSpeaker()) > 0)
        return TRUE;
    return FALSE;
}

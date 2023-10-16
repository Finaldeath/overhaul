//::///////////////////////////////////////////////
//:: Name q1_chk_cureminor
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Check to see if PC has cure minor wounds memorized
    (or useable).
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 12/03
//:://////////////////////////////////////////////

int StartingConditional()
{
    if (GetHasSpell(SPELL_CURE_MINOR_WOUNDS, GetPCSpeaker()) > 0)
        return TRUE;
    return FALSE;
}

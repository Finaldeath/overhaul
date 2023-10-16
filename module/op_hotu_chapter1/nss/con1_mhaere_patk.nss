//::///////////////////////////////////////////////
//:: Name con1_mhaere_patk
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
        Returns true for Mhaere's conversation
        right after the attack.
*/
//:://////////////////////////////////////////////
//:: Created By:  Keith Warner
//:: Created On:  Nov 27/02
//:://////////////////////////////////////////////

int StartingConditional()
{
    if (GetLocalInt(GetModule(), "nYPAttackOn") == 2)
        return TRUE;
    return FALSE;
}

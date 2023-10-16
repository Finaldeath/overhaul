//::///////////////////////////////////////////////
//:: Name: con_q2dswalk_dex
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
        The option to cross the stone walkway will
        appear if the PCs DEX is greater than 14
*/
//:://////////////////////////////////////////////
//:: Created By:Keith warner
//:: Created On: Dec 12/02
//:://////////////////////////////////////////////

int StartingConditional()
{
    if ( GetAbilityScore(GetPCSpeaker(), ABILITY_DEXTERITY) > 14)
        return TRUE;
    return FALSE;
}

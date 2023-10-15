//::///////////////////////////////////////////////
//:: FileName M0q01herbfight
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 4/25/2002 10:21:34 AM
//:://////////////////////////////////////////////
int StartingConditional()
{

    // Restrict based on the player's class
    if((GetLevelByClass(CLASS_TYPE_BARBARIAN, GetPCSpeaker()) == 0) &&
       (GetLevelByClass(CLASS_TYPE_FIGHTER, GetPCSpeaker()) == 0) &&
       (GetLevelByClass(CLASS_TYPE_MONK, GetPCSpeaker()) == 0) &&
       (GetLevelByClass(CLASS_TYPE_PALADIN, GetPCSpeaker()) == 0) &&
       (GetLevelByClass(CLASS_TYPE_RANGER, GetPCSpeaker()) == 0))
        return FALSE;

    return TRUE;
}

//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Checks to see if PC is a human, elf or
     half elf bard.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Nov 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();

    if ((GetRacialType(oPC) == RACIAL_TYPE_HUMAN || GetRacialType(oPC) == RACIAL_TYPE_ELF || GetRacialType(oPC) == RACIAL_TYPE_HALFELF) && GetLevelByClass(CLASS_TYPE_BARD, oPC))
        return TRUE;
    return FALSE;
}

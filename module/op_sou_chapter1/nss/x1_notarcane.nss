//::///////////////////////////////////////////////
//:: Check Not Arcane
//:: x1_arcane
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks if the PC is not a Wizard, Sorcerer or Bard
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: March 27, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int nClass;
    nClass = GetLevelByClass(CLASS_TYPE_BARD, GetPCSpeaker());
    nClass += GetLevelByClass(CLASS_TYPE_WIZARD, GetPCSpeaker());
    nClass += GetLevelByClass(CLASS_TYPE_SORCERER, GetPCSpeaker());
    if (nClass==0)
    {
        return TRUE;
    }
    return FALSE;
}

//::///////////////////////////////////////////////
//:: Check Arcane
//:: con_os_sorc_wiz
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks if the PC is a Wizard or Sorcerer
*/
//:://////////////////////////////////////////////
//:: Created By: Cori May
//:: Created On: August 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int nClass;
    nClass = GetLevelByClass(CLASS_TYPE_WIZARD, GetFirstPC());
    nClass += GetLevelByClass(CLASS_TYPE_SORCERER, GetFirstPC());
    if (nClass>0)
    {
        return TRUE;
    }
    return FALSE;
}


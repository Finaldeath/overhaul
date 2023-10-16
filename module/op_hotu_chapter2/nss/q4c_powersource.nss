//::///////////////////////////////////////////////
//:: q4c_PowerSource
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
  Checks if player has the Power Source
*/
//:://////////////////////////////////////////////
//:: Created By: Drew Karpyshyn
//:: Created On: August 21, 2003
//:://////////////////////////////////////////////


int StartingConditional()
{
    int iResult;

    iResult = GetItemPossessedBy(GetPCSpeaker(),"q4_power_source")!=OBJECT_INVALID;
    return iResult;
}

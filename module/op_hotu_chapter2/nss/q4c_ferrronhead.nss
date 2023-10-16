//::///////////////////////////////////////////////
//:: q4c_FerronHead
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
  Checks if player has Ferron's Head
*/
//:://////////////////////////////////////////////
//:: Created By: Drew Karpyshyn
//:: Created On: August 21, 2003
//:://////////////////////////////////////////////


int StartingConditional()
{
    int iResult;

    iResult = GetItemPossessedBy(GetPCSpeaker(),"q4c_ferron_head")!=OBJECT_INVALID;
    return iResult;
}


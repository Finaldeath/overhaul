//::///////////////////////////////////////////////
//:: q4c_ghostgem
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Checks if player has soul gem in their possession
*/
//:://////////////////////////////////////////////
//:: Created By: Drew Karpyshyn
//:: Created On: August 18, 2003
//:://////////////////////////////////////////////


int StartingConditional()
{
    int iResult;

    iResult = GetItemPossessedBy(GetPCSpeaker(),"SoulGem")!=OBJECT_INVALID;
    return iResult;
}

//::///////////////////////////////////////////////
//:: Check for Wanev's Wardstone
//:: M2Q3ALerk1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Player has the wardstone
*/
//:://////////////////////////////////////////////
//:: Created By: Kevin Martens
//:: Created On: Jan. 30, 2002
//:://////////////////////////////////////////////


int StartingConditional()
{
    int iResult;

    iResult = GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M2Q01IWARDWANEV"));
    return iResult;
}

//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Checks if the player has seeds.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Jan 6, 2003
//:://////////////////////////////////////////////
int StartingConditional()
{
    int iResult;
    object oPC = (GetPCSpeaker());

    iResult = GetIsObjectValid(GetItemPossessedBy(oPC,"q2bratseeds"));
    return iResult;
}

//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Check if Adam already spoke to PC
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Feb 24, 2003
//:://////////////////////////////////////////////
int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(), "X1_BLAKESPOKE")==1;
    return iResult;
}

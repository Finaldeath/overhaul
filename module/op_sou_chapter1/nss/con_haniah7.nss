//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Checks if the PC is done the Piper Quest.

*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Feb 12, 2003
//:://////////////////////////////////////////////
int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(),"X1_PIPERQUEST")==99;
    return iResult;
}

//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Check if PC knows J'Nah has the dragon's claw
     and has asked about it.
*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Mar 12, 2003
//:://////////////////////////////////////////////
int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"X1_JNAHCLAW")==10;
    return iResult;
}

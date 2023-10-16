//::///////////////////////////////////////////////
//:: Name
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Checks if the PC is on the Piper Quest.

*/
//:://////////////////////////////////////////////
//:: Created By: Dan Whiteside
//:: Created On: Feb 12, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    if (GetLocalInt(GetPCSpeaker(),"X1_PIPERQUEST")<10
        && GetLocalInt(GetModule(),"HANIAHSPEAK")==20)
        return TRUE;
    return FALSE;
}

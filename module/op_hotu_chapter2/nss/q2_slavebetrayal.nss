//::///////////////////////////////////////////////
//:: q2_slavebetrayal
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Shows up if the player betrayed Argosus and the
    slaves to the Overmind
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////
int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(),"X2_Q2Dslave_betrayal")==TRUE;
    return iResult;
}

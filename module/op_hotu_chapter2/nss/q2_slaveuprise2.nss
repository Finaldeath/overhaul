//::///////////////////////////////////////////////
//:: q2_slaveuprising
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
  slaves have agreed to postpone their uprising
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////


int StartingConditional()
{
    if (GetLocalInt(GetModule(), "X2_Q2DSlaveUprising") == 2 && GetLocalInt(GetModule(),"X2_Q2Dslave_betrayal")==FALSE)
        return TRUE;

    return FALSE;
}

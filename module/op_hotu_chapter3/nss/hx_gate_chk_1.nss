//::///////////////////////////////////////////////
//:: hx_gate_chk_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Gate check
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 23, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iGate =  GetLocalInt(GetModule(), "bGatekeeper_PilgrimHome");
    if(iGate == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}


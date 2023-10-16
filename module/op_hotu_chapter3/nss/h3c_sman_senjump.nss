//::///////////////////////////////////////////////
//:: Sleeping Man, Sensei Jumped (Condition Script)
//:: H3c_SMan_SenJump.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player killed the Sensei
     after waking the Sleeping Man (ie: she made
     the jump into his chambers).
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 16, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bJump = GetLocalInt(GetModule(), "bSenseiJumped");
    object oSensei = GetObjectByTag("H2_Sensei");

    if (bJump == TRUE)
    {
        if(GetIsDead(oSensei))
        {
            return TRUE;
        }
        return FALSE;
    }
    return FALSE;
}

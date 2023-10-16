//::///////////////////////////////////////////////
//:: Sleeping Man, Sensei Didn't Jump (Condition Script)
//:: H3c_SMan_NoJump.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player killed the Sensei
     prior to waking the Sleeping Man.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 22, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bJump = GetLocalInt(GetModule(), "bSenseiJumped");
    object oSensei = GetObjectByTag("H2_Sensei");

    if (bJump == FALSE)
    {
        if(GetIsDead(oSensei))
        {
            return TRUE;
        }
        return FALSE;
    }
    return FALSE;
}

//::///////////////////////////////////////////////
//:: Sleeping Man, Sensei Didn't Jump, PC Cut Him (Condition Script)
//:: H3c_SMan_NoJumpK.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the player killed the Sensei
     prior to waking the Sleeping Man by cutting
     him.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 16, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oMan = GetObjectByTag("H2_SleepingMan");
    int bCut = GetLocalInt(oMan, "bPlayerCutMe");
    int bJump = GetLocalInt(GetModule(), "bSenseiJumped");
    object oSensei = GetObjectByTag("H2_Sensei");

    if (bCut == TRUE &&
        bJump == FALSE)
    {
        if(GetIsDead(oSensei))
        {
            return TRUE;
        }
        return FALSE;
    }
    return FALSE;
}

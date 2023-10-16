//::///////////////////////////////////////////////
//:: Sensei Dharvana, Arden Swift is Alive (Condition Script)
//:: H2c_Sens_ArdLive.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if Arden Swift is still alive
     and the player has talked to him.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 8, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int bTalked = GetLocalInt(GetModule(), "bTalkedToArden");
    object oArden = GetObjectByTag("H2_ArdenSwift");
    int bDead = GetIsDead(oArden);
    if (bTalked == TRUE &&
        bDead == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}

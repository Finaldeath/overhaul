//::///////////////////////////////////////////////
//:: End Narration, Sleeping Man (Condition Script)
//:: H10c_End_Sman1.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Returns TRUE if the Sleeping Man is dead
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: October 31, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
/*    object oMan = GetObjectByTag("H2_SleepingMan");
    object oManEndBattle = GetObjectByTag("hx_sleepman_end");
    int bManEndBattle = GetLocalInt(GetModule(), "HX_SLEEPING_END_BATTLE");
    int bGameDead;
    if (bManEndBattle == FALSE)
    {
        bGameDead = GetIsDead(oMan);
    }
    else
    {
        bGameDead = !GetIsObjectValid(oManEndBattle);
    } */
    int bPlotDead = GetLocalInt(GetModule(), "bSleepingManPlotDead");

    if (/* bGameDead == TRUE || */
        bPlotDead == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}

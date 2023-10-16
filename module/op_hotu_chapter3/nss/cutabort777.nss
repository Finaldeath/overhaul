// Abort script for cutscene 777 (devil's army)

void main()
{
    object oPC = GetLastPCToCancelCutscene();
    if(GetIsPossessedFamiliar(oPC))
        oPC = GetMaster(oPC);
    int i = 1;
    FadeToBlack(oPC, FADE_SPEED_FAST);
    DelayCommand(3.0, FadeFromBlack(oPC, FADE_SPEED_FAST));
    object oDevil;
    object oCurrentWP = GetNearestObjectByTag("yj_wp_devil_sp", oPC, i);
    object oCurrentDevil = GetNearestObjectByTag("yj_devil", oPC, i);
    object oWPCharge;
    object oPitFiend = GetObjectByTag("yj_pitfiend");
    object oPitFiendReturn = GetWaypointByTag("yj_wp_devil_return");

    DelayCommand(1.0, AssignCommand(oPitFiend, JumpToObject(oPitFiendReturn)));

    while(oCurrentDevil != OBJECT_INVALID)
    {
        oWPCharge = GetNearestObjectByTag("yj_wp_devil_run", oCurrentWP);
        DelayCommand(1.0, AssignCommand(oCurrentDevil, JumpToObject(oCurrentWP)));
        DelayCommand(2.0, AssignCommand(oCurrentDevil, ActionMoveToObject(oWPCharge)));
        i++;
        oCurrentWP = GetNearestObjectByTag("yj_wp_devil_sp", oPC, i);
        oCurrentDevil = GetNearestObjectByTag("yj_devil", oPC, i);
    }
    DelayCommand(2.0, AdjustReputation(oPC, oPitFiend, -100));
    DelayCommand(2.0, AdjustReputation(oPitFiend, oPC, -100));
    SetLocalInt(GetArea(oPC), "DELAY_STATRED", 1); // used for savegame detection
    DelayCommand(10.0, SetLocalInt(GetArea(oPC), "YJ_FIGHT_STARTED", 1));
}

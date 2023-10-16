// Katriana talked about the missing guide

void main()
{
    object oDoor = GetNearestObjectByTag("Q1AT_CaravanCamp_FortuneTeller"); // time to unlock this door
    SetLocked(oDoor, FALSE);
    SetLocalInt(OBJECT_SELF, "Q1_TALKED_ABOUT_MISSING_GUIDE", 1);
    object oTorias = GetNearestObjectByTag("Q1_TORIAS");
    SetCommandable(TRUE, oTorias);
    SignalEvent(oTorias, EventUserDefined(101)); // revive if dead and come over
    object oDeekin = GetNearestObjectByTag("x0_hen_dee");
    object oDorna = GetNearestObjectByTag("x0_hen_dor");
    object oXanos = GetNearestObjectByTag("x0_hen_xan");
    effect eHeal = EffectHeal(100);
    if(GetMaster(oDeekin) == OBJECT_INVALID)
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eHeal, oDeekin);
    if(GetMaster(oXanos) == OBJECT_INVALID)
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eHeal, oXanos);
    if(GetMaster(oDorna) == OBJECT_INVALID)
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eHeal, oDorna);
    SetImmortal(oDeekin, FALSE);
    SetImmortal(oDorna, FALSE);
    SetImmortal(oXanos, FALSE);
    SetPlotFlag(oDeekin, FALSE);
    SetPlotFlag(oXanos, FALSE);
    SetPlotFlag(oDorna, FALSE);
    //AssignCommand(oTorias, ClearAllActions());
    //AssignCommand(oTorias, ActionMoveToLocation(GetLocation(GetPCSpeaker()), TRUE));
}

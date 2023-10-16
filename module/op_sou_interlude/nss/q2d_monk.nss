// monk room: close door behind player and play voice chat for monk

void Close(object oDoor)
{
    AssignCommand(oDoor, ActionCloseDoor(oDoor));
    SetLocked(oDoor, TRUE);
}

void BringMonk(object oPC)
{
    object oWP = GetWaypointByTag("Q2D_WP_MONK_SP");
    effect eVis = EffectVisualEffect(VFX_FNF_WAIL_O_BANSHEES);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(oWP));
    object oMonk = CreateObject(OBJECT_TYPE_CREATURE, "masterzaar004", GetLocation(oWP));
    DelayCommand(3.0, PlayVoiceChat(VOICE_CHAT_BATTLECRY1, oMonk));
}

void main()
{
    object oPC = GetEnteringObject();
    if(!GetIsPC(oPC))
        return;
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);

    AssignCommand(oPC, ClearAllActions());
    object oDoor = GetNearestObjectByTag("Q2D_MONK_DOOR");
    Close(oDoor);
    BringMonk(oPC);
}


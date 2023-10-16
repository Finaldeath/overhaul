// Teleport Kel-Garas back to his tomb

void main()
{
    object oEnter = GetEnteringObject();
    object oWP = GetWaypointByTag("Q2E_WP_KELGARAS_RET");
    if(GetTag(oEnter) == "Q2_KELGARAS2")
    {
        AssignCommand(oEnter,ClearAllActions());
        SetLocalInt(oEnter, "COMBAT_STARTED", 0); // so he won't jump around the room
        SetLocalInt(oEnter, "IN_COMBAT", 0);
        effect eVis = EffectVisualEffect(VFX_FNF_DISPEL);
        location lLoc = GetLocation(oWP);
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(oEnter));
        DelayCommand(0.4, AssignCommand(oEnter, JumpToLocation(lLoc)));
        DelayCommand(0.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, lLoc));
    }
}

//Kobold will run for the window to escape
//Kobold has been charmed
void BreakWindow(object oPC);
void main()
{
    object oKobold = GetObjectByTag("q1h2_kblake");
    if (GetLocalInt(oKobold, "nCharmed") == 1)
    {
        object oPC = GetPCSpeaker();

        DelayCommand(1.0, AssignCommand(oKobold, ActionPlayAnimation(ANIMATION_FIREFORGET_VICTORY2)));
        DelayCommand(2.0, AssignCommand(oKobold, ActionMoveToObject(GetWaypointByTag("wp_q1h1_kexit"), TRUE)));
        DelayCommand(5.0, BreakWindow(oPC));
        SetLocalInt(oKobold, "nGaveBaby", 1);
    }
}
void BreakWindow(object oPC)
{
    object oKobold = GetObjectByTag("q1h2_kblake");
    if (GetIsObjectValid(oKobold) == TRUE && GetIsInCombat(oKobold) == FALSE && IsInConversation(oKobold) == FALSE)
    {
        location lGlass = GetLocation(GetObjectByTag("q1hwindow"));

        vector vGlass1 = GetPosition(GetObjectByTag("q1hwindow"));
        vGlass1 = Vector(vGlass1.x, vGlass1.y, vGlass1.z + 1.0);
        location lGlass1 = Location(GetArea(OBJECT_SELF), vGlass1, 0.0);

        vector vGlass2 = GetPosition(GetObjectByTag("q1hwindow"));
        vGlass2 = Vector(vGlass2.x, vGlass2.y, vGlass2.z + 2.0);
        location lGlass2 = Location(GetArea(OBJECT_SELF), vGlass2, 0.0);

        AssignCommand(oPC, PlaySound("as_cv_glasbreak3"));

        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_COM_HIT_SONIC), lGlass);
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_COM_HIT_SONIC), lGlass1);
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_COM_HIT_SONIC), lGlass2);
    }
}

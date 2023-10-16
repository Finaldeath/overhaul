// Sphinx flies away

void main()
{
    //effect eFly = EffectDisappear();
    //ApplyEffectToObject(DURATION_TYPE_INSTANT, eFly, OBJECT_SELF);

    object oWP = GetWaypointByTag("Q3B_WP_SPHINX_EXIT");
    ActionForceMoveToObject(oWP, TRUE, 1.0, 10.0);
    ActionDoCommand(DestroyObject(OBJECT_SELF));
    SetCommandable(FALSE);
}

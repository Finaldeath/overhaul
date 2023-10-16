// jumping the player to the cave after restoring the mirror.
// destroying all mirror shards and giving the player the assembled mirror.

void main()
{
    object oPC = GetPCSpeaker();
    if(oPC == OBJECT_INVALID)
        oPC = GetFirstPC();
    // some fireworks...
    effect eVis = EffectVisualEffect(VFX_FNF_MYSTICAL_EXPLOSION);
    float fDelay;
    int i = 1;
    object oWP = GetNearestObjectByTag("q6f_wp_boom", OBJECT_SELF, i);
    while(oWP != OBJECT_INVALID)
    {
        DelayCommand(fDelay, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(oWP)));
        i++;
        fDelay += 0.3;
        oWP = GetNearestObjectByTag("q6f_wp_boom", OBJECT_SELF, i);
    }

    SignalEvent(GetArea(OBJECT_SELF), EventUserDefined(101));
    object oObject = GetFirstItemInInventory(oPC);
    while(oObject != OBJECT_INVALID)
    {
        if(GetTag(oObject) == "q6_shard")
        {
            SetPlotFlag(oObject, FALSE);
            DestroyObject(oObject);
        }
        oObject = GetNextItemInInventory(oPC);
    }
    // give player assembled mirror:
    CreateItemOnObject("q6_mirror", oPC);
}

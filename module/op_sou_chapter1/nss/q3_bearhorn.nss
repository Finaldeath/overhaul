// Gnoll Beastmaster's horn unique power: make bears friendly and call them.
//q3_bearhorn

void HateGnolls(object oBear)
{
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);
    ChangeToStandardFaction(oBear, STANDARD_FACTION_DEFENDER);
    object oGnoll1 = GetObjectByTag("Q3_CHIEF_FACTION");
    object oGnoll2 = GetObjectByTag("Q3_GNOLL_FACTION");
    AdjustReputation(oBear, oGnoll1, -100);
    AdjustReputation(oGnoll1, oBear, -100);
    AdjustReputation(oBear, oGnoll2, -100);
    AdjustReputation(oGnoll2, oBear, -100);
}

void main()
{
    object oItem = GetItemActivated();
    object oPC = GetItemActivator();

    if(GetTag(GetArea(oPC)) != "Q3_HighForestGnollCaves")
       return; // only works in the gnoll caves

    effect eVis = EffectVisualEffect(VFX_FNF_HOWL_ODD);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oPC);

    int i;
    object oBear;
    for(i = 1; i <=5; i++)
    {
        oBear = GetNearestObjectByTag("NW_BEARBLCK", oPC, i);
        if(oBear == OBJECT_INVALID)
            return;
        ChangeToStandardFaction(oBear, STANDARD_FACTION_COMMONER);
        HateGnolls(oBear);

        SetIsTemporaryFriend(oPC, oBear);
        object oHench = GetHenchman(oPC);
        if (GetIsObjectValid(oHench) == TRUE)
        {
            AssignCommand(oHench, ClearAllActions(TRUE));
            SetIsTemporaryFriend(oHench, oBear);

        }
        AssignCommand(oBear, ClearAllActions());
        AssignCommand(oBear, ActionMoveToObject(oPC, TRUE));
    }

}

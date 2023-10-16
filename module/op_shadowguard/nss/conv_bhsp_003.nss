void main()
{
    object oPC = GetPCSpeaker();

    ChangeToStandardFaction(OBJECT_SELF, STANDARD_FACTION_HOSTILE);

    DelayCommand(1.5, SetPlotFlag(OBJECT_SELF, FALSE));

    DelayCommand(2.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(TRUE), OBJECT_SELF));
}

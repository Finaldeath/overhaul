// Summon 2 myrmarchs to help the player in a fight

void main()
{
    object oPC = GetItemActivator();
    object oItem = GetItemActivated();
    effect eSummon = EffectSummonCreature("form_myrmarch001", VFX_FNF_SUMMON_MONSTER_3, 0.5);
    /*if(GetTag(GetArea(oPC)) != "q3b_AnaurochExcavatedRuins")
    {
        FloatingTextStrRefOnCreature(40518, oPC);
        return;
    }*/
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eSummon, oPC, HoursToSeconds(3));
    //effect eVis = EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_3);
    //object oMyrmarch1 = CreateObject(OBJECT_TYPE_CREATURE, "form_myrmarch001", GetLocation(oPC));
    //object oMyrmarch2 = CreateObject(OBJECT_TYPE_CREATURE, "form_myrmarch001", GetLocation(oPC));
    //ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(oMyrmarch1));
    //ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(oMyrmarch2));
    //SetLocalObject(GetArea(oPC), "Q3B_MYRMARCH", oMyrmarch1); // used later to unsummon it
    //SetPlotFlag(oItem, FALSE);
    //DestroyObject(oItem);
}

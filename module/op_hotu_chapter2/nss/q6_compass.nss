// Merchant's compass:
// pulse with increase frequency the closer the user is to the chest.

void main()
{
    object oPC = GetItemActivator();
    object oChest = GetObjectByTag("q6_HiddenChestTrigger");
    if(oChest != OBJECT_INVALID)
    {
        int nActive = GetLocalInt(GetArea(OBJECT_SELF), "COMPASS_ACTIVE");
        effect eVis = EffectVisualEffect(VFX_FNF_LOS_HOLY_10);
        effect eVis2 = EffectVisualEffect(VFX_DUR_GLOW_YELLOW);
        // if active then turn off, otherwise - turn on.
        if(nActive == 0) // then turn on
        {
            SetLocalInt(GetArea(OBJECT_SELF), "COMPASS_ACTIVE", 1);
            SetLocalObject(GetArea(OBJECT_SELF), "COMPASS_USER", oPC);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oPC);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eVis2, oPC, 7.0);
        }
        else // turn off
        {
            SetLocalInt(GetArea(OBJECT_SELF), "COMPASS_ACTIVE", 0);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oPC);
        }
    }
}

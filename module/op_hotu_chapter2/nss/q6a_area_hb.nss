// Winged elf city heart-beat event:
// Handle the merchant's compass if active.

void main()
{
    if(GetLocalInt(OBJECT_SELF, "COMPASS_ACTIVE") == 1)
    {
        object oPC = GetLocalObject(OBJECT_SELF, "COMPASS_USER");
        if(GetArea(oPC) != OBJECT_SELF)
            return;
        object oChest = GetObjectByTag("q6_HiddenChestTrigger");
        float fDistance = GetDistanceBetween(oPC, oChest);
        effect eVis2 = EffectVisualEffect(VFX_DUR_GLOW_YELLOW);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eVis2, oPC, 7.0);
        int MAX_FREQ = 30;
        // frequency should be between 1 and MAX_FREQ (in each heart-beat).
        // Distance lower then 4m would be max frequency
        // Beyond then, the frequence loses one pulse for every 2m.
        int nFreq = MAX_FREQ - FloatToInt(fDistance / 2.0);
        if(nFreq < 1)
            nFreq = 1;
        int i = 1;
        effect eVis = EffectVisualEffect(462);
        // The fDelayJump is the delay between each pulse.
        float fDelayJump = 6.0 / nFreq; // all pulses are inside a 6 seconds heartbeat.
        float fDelay;
        for(i = 1; i <= nFreq; i++)
        {
            DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oPC));
            fDelay += fDelayJump;
        }
    }
}

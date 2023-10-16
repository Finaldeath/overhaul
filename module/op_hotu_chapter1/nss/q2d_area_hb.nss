// Handle the sparks at the portal

void main()
{
    // each HB (only if there is a pc in the area):
    // 1. Find a random couple of flashers.
    // 2. Determine a random time for the event to occur inside the HB time frame.
    // 3. Fire a lightning beam between the flashers.

    if(GetLocalInt(OBJECT_SELF, "PLAYERS_NUM") > 0)
    {
        int i;
        object oHalaster;
        int nRand1;
        int nRand2;
        float fDelay;
        effect eBeam;
        object oFlasher1;
        object oFlasher2;
        effect eFire = EffectVisualEffect(VFX_FNF_FIREBALL);
        int nDamage;
        object oTarget;
        effect eDamage;
        effect eVis  = EffectVisualEffect(VFX_IMP_LIGHTNING_S);
        // If the portal has been re-configured to zap creatures
        if(GetLocalInt(OBJECT_SELF, "CHANNEL_PORTAL") == 1)
        {
            object oHandmaiden = GetObjectByTag("q2d_handmaiden");
            SignalEvent(oHandmaiden, EventUserDefined(101));
            // Determine number of creatures
            int n;
            object oCreature = GetFirstObjectInArea(OBJECT_SELF);
            while(oCreature != OBJECT_INVALID)
            {
                if(GetObjectType(oCreature) == OBJECT_TYPE_CREATURE)
                    n++;
                oCreature = GetNextObjectInArea(OBJECT_SELF);
            }
            for(i = 1; i <= 6; i++)
            {
                oHalaster = GetObjectByTag("q2d_halaster"); // needed as focus
                nRand1 = Random(7) + 1; // bolt origin
                fDelay = ((Random(5) + 1) * 0.2) + IntToFloat(i) - 1;
                int nDamage = Random(31) + 5;
                nRand2 = Random(n) + 1; // target
                oTarget = GetNearestObject(OBJECT_TYPE_CREATURE, oHalaster, nRand2);
                nDamage = GetReflexAdjustedDamage(nDamage, oTarget, 20, SAVING_THROW_TYPE_ELECTRICITY);
                eDamage = EffectDamage(nDamage, DAMAGE_TYPE_ELECTRICAL);
                if(nDamage > 0)
                {
                     DelayCommand(fDelay + 0.3, ApplyEffectToObject(DURATION_TYPE_INSTANT,eDamage,oTarget));
                     DelayCommand(fDelay + 0.3, ApplyEffectToObject(DURATION_TYPE_INSTANT,eVis,oTarget));
                }
                oFlasher1 = GetNearestObjectByTag("q2d_energy_tar", oHalaster, nRand2);
                eBeam = EffectBeam(VFX_BEAM_LIGHTNING, oFlasher1, BODY_NODE_HAND);
                DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eBeam, oTarget, 0.5));
            }
        }
        else
        {
            for(i = 1; i <= 6; i++)
            {
                oHalaster = GetObjectByTag("q2d_halaster");
                nRand1 = Random(11) + 1;
                nRand2 = Random(7) + 1;
                fDelay = ((Random(5) + 1) * 0.2) + IntToFloat(i) - 1;

                oFlasher1 = GetNearestObjectByTag("q2d_energy_flash", oHalaster, nRand1);
                oFlasher2 = GetNearestObjectByTag("q2d_energy_tar", oHalaster, nRand2);
                eBeam = EffectBeam(VFX_BEAM_LIGHTNING, oFlasher1, BODY_NODE_HAND);
                DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eBeam, oFlasher2, 0.5));
            }
        }
    }
}

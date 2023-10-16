// * The heartbeat script sets up the particular damage immunity
// * Removes the Damage Immunity
void main()
{
object oGolem = GetObjectByTag("M3Q3_IRONGOLEM17");
location lLocation = GetLocation(OBJECT_SELF);
int bValid = FALSE;

//* Was going to send a bolt of lightning to the golem with the contraption
//* is destroyed.  Currently placeables have no 'nodes'
 effect eLightning = EffectBeam(VFX_BEAM_LIGHTNING, OBJECT_SELF, BODY_NODE_HAND);
 ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eLightning,oGolem,1.0);
effect eVis  = EffectVisualEffect(VFX_IMP_FLAME_M);
effect eDispel  = EffectVisualEffect(VFX_IMP_DISPEL);

ApplyEffectAtLocation(DURATION_TYPE_INSTANT,eVis,lLocation);
ApplyEffectToObject(DURATION_TYPE_INSTANT,eDispel,oGolem);

effect eTest = GetFirstEffect(oGolem);

while(GetIsEffectValid(eTest) && bValid == FALSE)
    {
        if(GetEffectType(eTest) == EFFECT_TYPE_DAMAGE_IMMUNITY_INCREASE)
            {
                // * if this generator created the effect
                // * then remove it.
                if (GetEffectCreator(eTest) == OBJECT_SELF)
                {
                if(GetEffectDurationType(eTest) == DURATION_TYPE_PERMANENT)
                    {
                       // SpeakString("Removed");
                        RemoveEffect(oGolem,eTest);
                        int nCount = GetLocalInt(GetModule(), "NW_G_M3Q3_GENDESTROYED");
                        SetLocalInt(GetModule(), "NW_G_M3Q3_GENDESTROYED", nCount++);
                        bValid = TRUE;
                        // * if all four generators are destroyed then destroy the golem
                        object oGolem = GetNearestObjectByTag("M3Q3_IRONGOLEM17");
                        if (GetIsObjectValid(oGolem) == TRUE)
                        {
                            if (
                            GetIsDead(GetNearestObjectByTag("M3Q3Generator1"))== TRUE &&
                            GetIsDead(GetNearestObjectByTag("M3Q3Generator2")) == TRUE &&
                            GetIsDead(GetNearestObjectByTag("M3Q3Generator3")) == TRUE &&
                            GetIsDead(GetNearestObjectByTag("M3Q3D17Blunt")) == TRUE)
                            {
                                ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectDeath(), oGolem);
                            }
                        }
                    }
                }
            }
        eTest = GetNextEffect(oGolem);
    }
}

#include "x2_inc_switches"
#include "nw_i0_generic"

void main()
{
    object oPump = GetNearestObjectByTag("q5_pump");
    object oIntruder = GetLocalObject(OBJECT_SELF,"X2_NW_I0_GENERIC_INTRUDER");

    if(GetDistanceBetween(oPump, OBJECT_SELF) <= 15.0 &&
        GetLocalInt(oPump, "ACTIVATED") == 0)
        {
            SetLocalInt(oPump, "ACTIVATED", 1);
            SetFacingPoint(GetPosition(oPump));
            effect eBeam = EffectBeam(VFX_BEAM_ODD, OBJECT_SELF, BODY_NODE_MONSTER_0);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eBeam, oPump, 1.0);
            DelayCommand(1.0, SignalEvent(oPump, EventUserDefined(101)));
        }
    SetCreatureOverrideAIScript(OBJECT_SELF, "x2_ai_behold");
    DetermineCombatRound(oIntruder);

}

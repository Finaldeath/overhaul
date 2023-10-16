// Debris: player sustains 2d6 damages (reflex save for half) - actual damage is on the on-exit event
// (dwarves detect it on the on-enter)

#include "nw_i0_plot"

void Dust(object oPC)
{
    //effect eDust = EffectDamage(1000);
    effect eDust = EffectVisualEffect(353);
    vector vPos = GetPosition(oPC);
    vector vPos1 = vPos;
    vector vPos2 = vPos;
    vector vPos3 = vPos;
    vector vPos4 = vPos;
    vPos1.z += 10;
    vPos2.z += 10;
    vPos3.z += 10;
    vPos4.z += 10;
    vPos1.x += 1;
    vPos2.x -= 1;
    vPos3.y += 1;
    vPos4.y -= 1;
    location lLoc1 = Location(GetArea(OBJECT_SELF), vPos1, 0.0);
    location lLoc2 = Location(GetArea(OBJECT_SELF), vPos2, 0.0);
    location lLoc3 = Location(GetArea(OBJECT_SELF), vPos3, 0.0);
    location lLoc4 = Location(GetArea(OBJECT_SELF), vPos4, 0.0);
    //if(GetLocalInt(OBJECT_SELF, "PLAYERS_AWARE_OF_DEBRIS") == 1)
    //    lLoc = GetLocation(OBJECT_SELF);
    //else
    //    lLoc = GetLocation(oPC);
    //object oBoulder = CreateObject(OBJECT_TYPE_PLACEABLE, "plc_boulder", lLoc);
    //ApplyEffectToObject(DURATION_TYPE_INSTANT, eDust, oBoulder);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eDust, lLoc1);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eDust, lLoc2);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eDust, lLoc3);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eDust, lLoc4);
}

void main()
{
    object oPC = GetEnteringObject();
    if(!GetIsPlayerCharacter(oPC))
        return;
    int nDamage = d6(3);
    effect eVis = EffectVisualEffect(VFX_FNF_SCREEN_SHAKE);
    int nTriggered = GetLocalInt(OBJECT_SELF, "TRIGGERED");
    if(nTriggered == 1)
        return;
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oPC);
    AssignCommand(oPC, PlaySound("as_na_rockcavsm2"));
    SetLocalInt(OBJECT_SELF, "TRIGGERED", 1);

    DelayCommand(0.1, Dust(oPC));
    //DelayCommand(0.3, Dust(oPC));
    DelayCommand(0.7, Dust(oPC));

    if(GetLocalInt(OBJECT_SELF, "PLAYERS_AWARE_OF_DEBRIS") == 1)
        return;
    nDamage = GetReflexAdjustedDamage(nDamage, oPC, 16);
    if(nDamage > 0)
    {
        effect eDam = EffectDamage(nDamage, DAMAGE_TYPE_BLUDGEONING);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oPC);
    }
}

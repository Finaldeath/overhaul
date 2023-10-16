// bring stone face

#include "nw_i0_generic"

void main()
{
    object oPC = GetEnteringObject();
    if(!GetIsPC(oPC))
        return;

    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);


    object oWP = GetWaypointByTag("Q2B_WP_HEAD_SP");
    vector vPos = GetPosition(oWP);
    vPos.z += 2;
    location lLoc = Location(GetArea(OBJECT_SELF), vPos, 0.0);
    object oStone = CreateObject(OBJECT_TYPE_PLACEABLE, "q3c_stone_face", lLoc);
    effect eVis = EffectVisualEffect(VFX_FNF_IMPLOSION);
    DelayCommand(0.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(oStone)));
    DelayCommand(1.0, AssignCommand(oStone, SpeakStringByStrRef(40525)));
    DelayCommand(4.0, DestroyObject(oStone));
}

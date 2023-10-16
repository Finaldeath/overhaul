// makes umber hulks jump out of the walls

#include "nw_i0_generic"

void CreateUmberHulk(object oWP, object oPC)
{
    object oHulk = CreateObject(OBJECT_TYPE_CREATURE, "q2umberhulk", GetLocation(oWP));
    AssignCommand(oHulk, ActionAttack(oPC));
}

void main()
{
    object oPC = GetEnteringObject();
    if(!GetIsPC(oPC))
        return;

    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);

    int i = 1;
    effect eRocks = EffectVisualEffect(VFX_COM_CHUNK_STONE_MEDIUM);
    effect eDust = EffectVisualEffect(VFX_IMP_DUST_EXPLOSION);
    location lLoc1, lLoc2, lLoc3;
    vector vPos;
    float fDelay1, fDelay2, fDelay3;
    object oWP = GetNearestObjectByTag("bk_umber", OBJECT_SELF, i);
    DelayCommand(0.2, AssignCommand(oPC, PlaySound("as_na_rockfallg1")));
    float fDistance;
    while(oWP != OBJECT_INVALID)
    {
        fDistance = GetDistanceBetween(OBJECT_SELF, oWP);
        if(fDistance > 20.0)
            return;
        vPos = GetPosition(oWP);
        lLoc1 = GetLocation(oWP);
        vPos.z += 1.2;
        lLoc2 = Location(GetArea(OBJECT_SELF), vPos, 0.0);
        vPos.z += 1.2;
        lLoc3 = Location(GetArea(OBJECT_SELF), vPos, 0.0);
        fDelay1 = IntToFloat(Random(10) + 1) * 0.2;
        fDelay2 = IntToFloat(Random(10) + 1) * 0.2;
        fDelay3 = IntToFloat(Random(10) + 1) * 0.2;
        DelayCommand(fDelay1, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eDust, lLoc1));
        DelayCommand(fDelay1, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eRocks, lLoc1));
        DelayCommand(fDelay2, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eRocks, lLoc2));
        DelayCommand(fDelay3, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eRocks, lLoc3));
        DelayCommand(1.5, CreateUmberHulk(oWP, oPC));
        i++;
        oWP = GetNearestObjectByTag("bk_umber", OBJECT_SELF, i);
    }

}

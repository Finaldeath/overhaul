// Stinger's temple area on-enter: Set pillars and altar beams holding Zidan

// var used in Katriana's dialog
void SetConvVar()
{
    object oPC = GetEnteringObject();
    if(!GetIsPC(oPC))
        return;
    SetLocalInt(oPC, "Q1_BEEN_IN_TEMPLE", 1);
}

void main()
{
    SetConvVar();
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ENTER_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_ENTER_ONCE", 1);

    vector vPos = Vector(24.0, 102.0, 5.5);
    location lLoc = Location(GetArea(OBJECT_SELF), vPos, 0.0);
    CreateObject(OBJECT_TYPE_PLACEABLE, "Q1_BEAM_SOURCE", lLoc);

    object oZidan = GetObjectByTag("Q1_ZIDAN");
    object oAltar = GetObjectByTag("Q1_ALTAR");
    object oTop1 = GetObjectByTag("Q1_TOP1");
    object oTop2 = GetObjectByTag("Q1_TOP2");

    effect eBeam1 = EffectBeam(VFX_BEAM_LIGHTNING, oTop1, BODY_NODE_CHEST);
    effect eBeam2 = EffectBeam(VFX_BEAM_LIGHTNING, oTop2, BODY_NODE_CHEST);
    effect eBeam3 = EffectBeam(VFX_BEAM_LIGHTNING, oAltar, BODY_NODE_CHEST);

    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eBeam1, oAltar);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eBeam2, oAltar);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eBeam3, oZidan);
}

//::///////////////////////////////////////////////
//:: Name q2d4_setupilsn
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

void main()
{
    int nEffect = 427;  //427 - 431    EffectVisualEffect(427) - Pillar
    effect eVis = EffectVisualEffect(nEffect);
    vector vPos;
    string szResRef;
    location lSpawn;
    object oArea = GetObjectByTag("q2dgrandhall");
    object oNewVfx;
    vector vNew;
    //Set up Pillar Illusions
    int nCount = 0;
    object oPillar = GetObjectByTag("vfx_q2d4_pillar", nCount);
    while (oPillar != OBJECT_INVALID)
    {
        vPos = GetPosition(oPillar);
        szResRef = GetResRef(oPillar);
        vNew = Vector(vPos.x, vPos.y, vPos.z + 0.1);
        lSpawn = Location(oArea, vNew, 0.0);
        DestroyObject(oPillar);
        oNewVfx = CreateObject(OBJECT_TYPE_PLACEABLE, szResRef, lSpawn, FALSE, "q2d4_vfx_final");

        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis, oNewVfx);
        nCount++;
        oPillar = GetObjectByTag("vfx_q2d4_pillar", nCount);
    }


    int nEffect2 = 429;  //427 - 431    EffectVisualEffect(429) - Cover
    effect eVis2 = EffectVisualEffect(nEffect2);
    nCount = 0;
    object oCover = GetObjectByTag("vfx_q2d4_cover", nCount);
    while (oCover != OBJECT_INVALID)
    {
        vPos = GetPosition(oCover);
        szResRef = GetResRef(oCover);
        vNew = Vector(vPos.x, vPos.y, vPos.z - 0.1);
        lSpawn = Location(oArea, vNew, 0.0);
        DestroyObject(oCover);
        oNewVfx = CreateObject(OBJECT_TYPE_PLACEABLE, szResRef, lSpawn, FALSE, "q2d4_vfx_final");
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVis2, oNewVfx);
        nCount++;
        oCover = GetObjectByTag("vfx_q2d4_cover", nCount);
    }

    //Set up Blade Barriers -  Real Ones
    nCount = 0;
    effect eBlade = EffectAreaOfEffect(AOE_PER_WALLBLADE);
    object oRealBlade = GetObjectByTag("vfx_q2d4_bladereal", nCount);
    while (oRealBlade != OBJECT_INVALID)
    {
        ApplyEffectAtLocation(DURATION_TYPE_PERMANENT, eBlade, GetLocation(oRealBlade));
        nCount++;
        oRealBlade = GetObjectByTag("vfx_q2d4_bladereal", nCount);
    }

    //Set up Blade Barriers -  Fake VFX Ones
    nCount = 0;
    effect eBlade2 = EffectAreaOfEffect(AOE_PER_WALLBLADE, "q2d_ent_ilsnblade", "q2d_hb_ilsnblade", "");
    object oFakeBlade = GetObjectByTag("vfx_q2d4_bladefake", nCount);
    while (oFakeBlade != OBJECT_INVALID)
    {
        ApplyEffectAtLocation(DURATION_TYPE_PERMANENT, eBlade2, GetLocation(oFakeBlade));
        nCount++;
        oFakeBlade = GetObjectByTag("vfx_q2d4_bladefake", nCount);
    }
}


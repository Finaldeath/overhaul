//::///////////////////////////////////////////////
//:: Tower Builder (OnSpawn)
//:: Sp_TowerBuilder.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Build the placeable Tower of the Winds at
     the heart of Undrentide.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: March 13, 2003
//:://////////////////////////////////////////////

void main()
{
    object oArea = GetArea(OBJECT_SELF);
    int iWallFacets = 11;
    int iCurrentFacet = 1;
    object oFacetBase = GetNearestObjectByTag("WindTowerFacet", OBJECT_SELF, iCurrentFacet);
    effect eVFX = EffectVisualEffect(VFX_DUR_ETHEREAL_VISAGE);
    location lFacetBase;
    vector vFacetBase;
    float fFacetBaseFacing;
    vector vTier1;
    vector vTier2;
    vector vTier3;
    vector vTier4;
    vector vTier5;
    vector vTier6;
    location lTier1;
    location lTier2;
    location lTier3;
    location lTier4;
    location lTier5;
    location lTier6;
    object oTier1;
    object oTier2;
    object oTier3;
    object oTier4;
    object oTier5;
    object oTier6;

    while (iCurrentFacet <= iWallFacets)
    {
        //Make the base facet pretty
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVFX, oFacetBase);

        //Stack 6 tiers on top of it
        lFacetBase = GetLocation(oFacetBase);
        fFacetBaseFacing = GetFacing(oFacetBase);
        vFacetBase = GetPositionFromLocation(lFacetBase);
        vTier1 = Vector(vFacetBase.x, vFacetBase.y, vFacetBase.z + 3.0);
        vTier2 = Vector(vFacetBase.x, vFacetBase.y, vFacetBase.z + 6.0);
        vTier3 = Vector(vFacetBase.x, vFacetBase.y, vFacetBase.z + 9.0);
        vTier4 = Vector(vFacetBase.x, vFacetBase.y, vFacetBase.z + 12.0);
        vTier5 = Vector(vFacetBase.x, vFacetBase.y, vFacetBase.z + 15.0);
        vTier6 = Vector(vFacetBase.x, vFacetBase.y, vFacetBase.z + 18.0);
        lTier1 = Location(oArea, vTier1, fFacetBaseFacing);
        lTier2 = Location(oArea, vTier2, fFacetBaseFacing);
        lTier3 = Location(oArea, vTier3, fFacetBaseFacing);
        lTier4 = Location(oArea, vTier4, fFacetBaseFacing);
        lTier5 = Location(oArea, vTier5, fFacetBaseFacing);
        lTier6 = Location(oArea, vTier6, fFacetBaseFacing);

        oTier1 = CreateObject(OBJECT_TYPE_PLACEABLE, "windtowerfacet", lTier1, FALSE, "WindTowerFacet1");
        oTier2 = CreateObject(OBJECT_TYPE_PLACEABLE, "windtowerfacet", lTier2, FALSE, "WindTowerFacet2");
        oTier3 = CreateObject(OBJECT_TYPE_PLACEABLE, "windtowerfacet", lTier3, FALSE, "WindTowerFacet3");
        oTier4 = CreateObject(OBJECT_TYPE_PLACEABLE, "windtowerfacet", lTier4, FALSE, "WindTowerFacet4");
        oTier5 = CreateObject(OBJECT_TYPE_PLACEABLE, "windtowerfacet", lTier5, FALSE, "WindTowerFacet5");
        oTier6 = CreateObject(OBJECT_TYPE_PLACEABLE, "windtowerfacet", lTier6, FALSE, "WindTowerFacet6");

        //Make the new tiers pretty
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVFX, oTier1);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVFX, oTier2);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVFX, oTier3);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVFX, oTier4);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVFX, oTier5);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVFX, oTier6);

        //Update loop variables and move to the next facet
        iCurrentFacet++;
        oFacetBase = GetNearestObjectByTag("WindTowerFacet", OBJECT_SELF, iCurrentFacet);
    }

    //Now make the doorway.
    object oDoorBase = GetNearestObjectByTag("WindTowerDoor");
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVFX, oDoorBase);
    location lDoorBase = GetLocation(oDoorBase);
    float fDoorBaseFacing = GetFacing(oDoorBase);
    vector vDoorBase = GetPositionFromLocation(lDoorBase);
    vTier1 = Vector(vDoorBase.x, vDoorBase.y, vDoorBase.z + 3.0);
    vTier2 = Vector(vDoorBase.x, vDoorBase.y, vDoorBase.z + 6.0);
    vTier3 = Vector(vDoorBase.x, vDoorBase.y, vDoorBase.z + 9.0);
    vTier4 = Vector(vDoorBase.x, vDoorBase.y, vDoorBase.z + 12.0);
    vTier5 = Vector(vDoorBase.x, vDoorBase.y, vDoorBase.z + 15.0);
    vTier6 = Vector(vDoorBase.x, vDoorBase.y, vDoorBase.z + 18.0);
    lTier1 = Location(oArea, vTier1, fDoorBaseFacing);
    lTier2 = Location(oArea, vTier2, fDoorBaseFacing);
    lTier3 = Location(oArea, vTier3, fDoorBaseFacing);
    lTier4 = Location(oArea, vTier4, fDoorBaseFacing);
    lTier5 = Location(oArea, vTier5, fDoorBaseFacing);
    lTier6 = Location(oArea, vTier6, fDoorBaseFacing);

    oTier1 = CreateObject(OBJECT_TYPE_PLACEABLE, "windtowerdoor", lTier1);
    oTier2 = CreateObject(OBJECT_TYPE_PLACEABLE, "windtowerdoor", lTier2);
    oTier3 = CreateObject(OBJECT_TYPE_PLACEABLE, "windtowerdoor", lTier3);
    oTier4 = CreateObject(OBJECT_TYPE_PLACEABLE, "windtowerdoor", lTier4);
    oTier5 = CreateObject(OBJECT_TYPE_PLACEABLE, "windtowerdoor", lTier5);
    oTier6 = CreateObject(OBJECT_TYPE_PLACEABLE, "windtowerdoor", lTier6);

    //Make the door tiers pretty
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVFX, oTier1);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVFX, oTier2);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVFX, oTier3);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVFX, oTier4);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVFX, oTier5);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eVFX, oTier6);

    //Destroy self once the tower's set up.
    DestroyObject(OBJECT_SELF, 1.0);
}

//::///////////////////////////////////////////////
//:: M3Q2E_ALTARDEATH
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Destroys the wild magic object
*/
//:://////////////////////////////////////////////
//:: Created By:    Cori May
//:: Created On:    April 25, 2002
//:://////////////////////////////////////////////

void main()
{
    object oWild = GetNearestObjectByTag("M3WILDMAGICCAST");
    object oDesign = GetNearestObjectByTag("M3Q2E_DESIGN");
    DestroyObject(GetNearestObjectByTag("M3Q2E_ALTEREVIL"));
    DestroyObject(GetNearestObjectByTag("M3Q2E_ALTERNEUTR"));
    DestroyObject(GetNearestObjectByTag("M3Q2E_ALTERGOOD"));
    DestroyObject(oDesign);
    DestroyObject(oWild);
    effect eVis = EffectVisualEffect(VFX_FNF_IMPLOSION);
    location lWay = GetLocation(GetNearestObjectByTag("M3Q2EWILDMAGES"));
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT,eVis,lWay);
}

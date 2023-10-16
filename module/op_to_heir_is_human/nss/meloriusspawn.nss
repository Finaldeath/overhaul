//::///////////////////////////////////////////////
//:: Entered
//:: MeloriusSpawn
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: June 17, 2002
//:://////////////////////////////////////////////

void main()
{
    object oEntered = GetEnteringObject();
    object oBody = GetObjectByTag("MeloriusBody");
    object oWaypoint = GetObjectByTag("WP_MeloriusSpawn");
    location lWaypoint = GetLocation(oWaypoint);
    int iDoOnce = GetLocalInt(GetModule(), "DoOnce");

    if (iDoOnce == FALSE)
    {
        if (GetIsPC(oEntered))
        {
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_DISPEL_GREATER),GetLocation(oBody));
            DestroyObject(oBody);
            CreateObject(OBJECT_TYPE_CREATURE,"melorius",lWaypoint);
            SetLocalInt(GetModule(), "DoOnce", TRUE);
        }
    }
}

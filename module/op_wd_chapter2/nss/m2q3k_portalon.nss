//::///////////////////////////////////////////////
//:: Conversation
//:: M2Q3K_PortalOn
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: March 15, 2002
//:://////////////////////////////////////////////

void main()
{
    object oWaypoint = GetWaypointByTag("WP_M2Q3K_Portal");
    object oLight = GetObjectByTag("M2Q3K_Light");
    object oJournal = GetItemPossessedBy(GetPCSpeaker(),"M2Q3KEXPJOURN");

    if (GetLocalInt(OBJECT_SELF,"NW_L_SpawnPortal") == 0)
    {
        SetLocalInt(OBJECT_SELF,"NW_L_SpawnPortal",1);
        SetPlotFlag(oLight,FALSE);
        SetPlotFlag(OBJECT_SELF,FALSE);
        ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_IMP_DEATH_L),OBJECT_SELF);
        ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_GAS_EXPLOSION_EVIL),OBJECT_SELF);
        DestroyObject(oJournal);
        DestroyObject(oLight);
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_DISPEL_GREATER),GetLocation(oWaypoint));
        CreateObject(OBJECT_TYPE_PLACEABLE,"M2Q3K_Portal",GetLocation(oWaypoint));
        DelayCommand(1.0,ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_IMP_LIGHTNING_M),OBJECT_SELF));
        DelayCommand(1.5,ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectDamage(GetCurrentHitPoints()),OBJECT_SELF));
    }
}

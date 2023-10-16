//::///////////////////////////////////////////////
//:: m2q3DD Wanev's Brazier Script
//:: m2q3WanevBraz
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    When Gulgash's heart is placed on the brazier,
    it closes the portal, sets an encounter active,
    and updates the appropriate journal entry
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: Unknown Date
//:: Last Updated By: Rob Bartel
//:: Last Updated On: Feb 21, 2002
//:://////////////////////////////////////////////

void main()
{
    object oHeart = GetItemPossessedBy(OBJECT_SELF,"M2Q3IGULGHEART");
    object oPortal = GetObjectByTag("M2Q3WANEVDEMPORT");
    object oPC = GetLastUsedBy();
    location lPortal = GetLocation(oPortal);

    if (GetIsObjectValid(oHeart))
    {
        DestroyObject(oHeart);
        DestroyObject(oPortal);
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_IMPLOSION),lPortal);
        DelayCommand(0.8,ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_IMP_LIGHTNING_M),lPortal));
        DelayCommand(1.8,ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_IMP_LIGHTNING_M),lPortal));
        DelayCommand(4.0,ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_GAS_EXPLOSION_EVIL),lPortal));
        DelayCommand(3.5,ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_FIREBALL),lPortal));
        SetEncounterActive(FALSE,GetObjectByTag("M2Q3WANEVDEMTRIG"));
        AddJournalQuestEntry("m2q1_Wanev", 30, oPC);
    }
}

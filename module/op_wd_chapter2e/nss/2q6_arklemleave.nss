//::///////////////////////////////////////////////
//:: Arklem Leave
//:: 2Q6_ArklemLeave
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    teleports away, opens sanctum door
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: MArch 1, 2002
//:://////////////////////////////////////////////

void main()
{
    object oDoor = GetNearestObjectByTag("2q6j_plotdoor");
    if(GetIsObjectValid(oDoor))
    {
        ActionCastFakeSpellAtObject(SPELL_KNOCK, oDoor);
        AssignCommand(oDoor, SetLocked(oDoor, FALSE));
        effect eVis = EffectVisualEffect(VFX_IMP_LIGHTNING_M);
        DelayCommand(2.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oDoor));
    }
    ActionWait(2.0);
    // need to insert scripting to cast spell to open door... then cast spell to leave
    effect eVis = EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_3);
    ActionCastFakeSpellAtObject(SPELL_MINOR_GLOBE_OF_INVULNERABILITY, OBJECT_SELF);
    DelayCommand(1.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(OBJECT_SELF)));
    DestroyObject(OBJECT_SELF, 2.5);
}

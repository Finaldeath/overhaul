//::///////////////////////////////////////////////
//:: Deltagar Leave
//:: 2Q6_Deltagar02
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    teleports away.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: MArch 1, 2002
//:://////////////////////////////////////////////

void main()
{
    effect eVis = EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_3);
    ActionCastFakeSpellAtObject(SPELL_MINOR_GLOBE_OF_INVULNERABILITY, OBJECT_SELF);
    DelayCommand(1.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(OBJECT_SELF)));
    DestroyObject(OBJECT_SELF, 2.5);
}

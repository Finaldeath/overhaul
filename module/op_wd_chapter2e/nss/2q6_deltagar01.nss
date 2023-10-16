//::///////////////////////////////////////////////
//:: Deltagar Set Help and Leave
//:: 2Q6_Deltagar01
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sets the help flag to true and teleports away.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: MArch 1, 2002
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(GetModule(),"Deltagar_Aids",1);
    effect eVis = EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_3);
    ActionCastFakeSpellAtObject(SPELL_MINOR_GLOBE_OF_INVULNERABILITY, OBJECT_SELF);
    DelayCommand(1.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(OBJECT_SELF)));
    DestroyObject(OBJECT_SELF, 2.5);

    //EscapeArea();
}

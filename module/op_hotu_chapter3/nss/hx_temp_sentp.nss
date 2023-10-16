//::///////////////////////////////////////////////
//:: Name hx_temp_sentp
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Sensei flees.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 23, 2003
//:://////////////////////////////////////////////

void main()
{
    location lLoc = GetLocation(OBJECT_SELF);

    //ActionCastFakeSpellAtObject(SPELL_BANISHMENT, OBJECT_SELF);
    DelayCommand(0.8, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_CUTSCENE_INVISIBILITY), OBJECT_SELF));
    DelayCommand(0.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_2), lLoc));
}

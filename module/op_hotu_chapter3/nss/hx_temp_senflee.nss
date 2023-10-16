//::///////////////////////////////////////////////
//:: Name hx_temp_senflee
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Sensei Flees.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 23, 2003
//:://////////////////////////////////////////////
void SleepAttack(object oPC, object oSleep);
void main()
{
    location lLoc = GetLocation(OBJECT_SELF);
    object oPC = GetPCSpeaker();
    object oSleep = GetObjectByTag("H2_SleepingMan");

    SetLocalInt(GetModule(), "HX_SENSEIFLEES", TRUE);

    ActionCastFakeSpellAtObject(SPELL_BANISHMENT, OBJECT_SELF);
    DelayCommand(1.8, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_CUTSCENE_INVISIBILITY), OBJECT_SELF));
    DelayCommand(1.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_2), lLoc));

    DelayCommand(0.2, SleepAttack(oPC, oSleep));

    DelayCommand(4.5, SetIsDestroyable(TRUE, FALSE, FALSE));
    DestroyObject(OBJECT_SELF, 5.0);
}

void SleepAttack(object oPC, object oSleep)
{
    SetPlotFlag(oSleep, FALSE);
    SetIsTemporaryEnemy(oPC, oSleep);
    AssignCommand(oSleep, ActionEquipMostDamagingMelee());
    DelayCommand(0.5, AssignCommand(oSleep, ActionAttack(oPC)));
}

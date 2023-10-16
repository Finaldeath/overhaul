//::///////////////////////////////////////////////
//:: Name q4a_miner_die
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script kills the miner who is explaining
    about killing the Shadows before hurting the
    end boss.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Jan 9, 2003
//:://////////////////////////////////////////////

void main()
{
   AssignCommand(GetLastSpeaker(), PlaySound("vs_nfanatm1_dead"));
   SetPlotFlag(OBJECT_SELF, 0);
   DelayCommand(0.1, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_COM_BLOOD_REG_RED), OBJECT_SELF));
   CreateObject(OBJECT_TYPE_PLACEABLE, "plc_bloodstain", GetLocation(OBJECT_SELF));
   DestroyObject(OBJECT_SELF, 0.1);
}

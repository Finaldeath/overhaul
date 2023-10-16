//::///////////////////////////////////////////////
//:: Name q4a_poly_gnt
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script will transform the PC into a Giant.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Jan 13, 2003
//:://////////////////////////////////////////////

void main()
{
   int iType;

   //if(GetGender(GetLastSpeaker()) == GENDER_FEMALE)
       iType = 94;
   //else
   //    iType = POLYMORPH_TYPE_FROST_GIANT_MALE;

   //int iStrength = GetAbilityScore(GetLastSpeaker(), ABILITY_STRENGTH);
   //int iNew;

   //if(iStrength < 60)
   //{
   //    iNew = 60 - iStrength;
   //    DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectAbilityIncrease(ABILITY_STRENGTH, iNew), GetLastSpeaker(), 60.0));
   //}
   //else
   //{
   //    DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectAbilityIncrease(ABILITY_STRENGTH, iStrength + 10), GetLastSpeaker(), 60.0));
   //}

   DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_FNF_PWKILL), GetLastSpeaker()));
   DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_FNF_SUMMON_UNDEAD), GetLastSpeaker()));
   DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectPolymorph(iType, TRUE), GetLastSpeaker(), 10.0));
   SetLocalInt(GetModule(), "HX_SEEN_GIANT_FORM", TRUE);
}

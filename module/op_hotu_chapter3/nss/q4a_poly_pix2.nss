//::///////////////////////////////////////////////
//:: Name q4a_poly_pix
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script will transform the PC into a pixie.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Jan 13, 2003
//:://////////////////////////////////////////////

void main()
{
   DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_IMP_POLYMORPH), GetLastSpeaker()));
   DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectPolymorph(POLYMORPH_TYPE_PIXIE), GetLastSpeaker(), 10.0));
   SetLocalInt(GetModule(), "HX_SEEN_PIXIE_FORM", TRUE);
}

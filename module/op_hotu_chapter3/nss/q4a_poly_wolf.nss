//::///////////////////////////////////////////////
//:: Name q4a_poly_wolf
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script will transform the PC into a wolf.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Jan 13, 2003
//:://////////////////////////////////////////////

// Make the block that keeps player from getting into wolf den.
void MakeBlock(location lLoc);

void main()
{
   object oBlock = GetObjectByTag("hx_wolf_block");
   object oStorage = GetObjectByTag("hx_wolf_den_storage");
   SetLocalLocation(oStorage, "HX_WOLF_BLOCK", GetLocation(oBlock));

   DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_FNF_NATURES_BALANCE), GetLastSpeaker()));
   DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_FNF_SUMMON_UNDEAD), GetLastSpeaker()));
   DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectPolymorph(POLYMORPH_TYPE_WOLF), GetLastSpeaker()));
   DelayCommand(1.0, DestroyObject(oBlock));
   //DelayCommand(61.0, MakeBlock(GetLocalLocation(GetModule(), "HX_WOLF_BLOCK")));
}

// Make the block that keeps player from getting into wolf den.
void MakeBlock(location lLoc)
{
    CreateObject(OBJECT_TYPE_PLACEABLE, "hx_wolf_block", lLoc);
}

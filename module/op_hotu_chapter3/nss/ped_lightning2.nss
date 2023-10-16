////////////////////////////////////////////////////////////////////////////////////////
// This script will cause the pedastels or gargoyle statues in Podunk's Throne Room
// to shoot lightning at each other.
//
// The targets are designated by the number after the tag. A beam will fire to 1 number
// greater and 1 number less. For example, if the current object's tag is ped16, its
// targets will be ped15 and ped17.
//
// This version is for the statues that creates a barrier when the fight starts.
//
// Created by: Brad Prince
// 9-13-02
//
////////////////////////////////////////////////////////////////////////////////////////

void main()
{
    int iFighting = GetLocalInt(OBJECT_SELF, "fighting");
    object oTarget = GetObjectByTag("ped54");
    object oTarget2 = GetObjectByTag("ped44");
    // This is done to be selective about when the beams are shooting.
    if(iFighting == 1)
       if(GetTag(OBJECT_SELF) == "ped44")
          ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_BEAM_LIGHTNING), oTarget, 7.0);
       else
          ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_BEAM_LIGHTNING), oTarget2, 7.0);
}

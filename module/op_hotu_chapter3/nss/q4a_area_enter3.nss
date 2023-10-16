//::///////////////////////////////////////////////
//:: Name: q4a_area_enter3
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script will create effects on the invis
    objects that will spawn in bone golems.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Jan 17, 2003
//:://////////////////////////////////////////////

void main()
{

    object oPC = GetEnteringObject();

    if(GetIsPC(oPC)) {
    // Do once
    if (GetLocalInt(OBJECT_SELF, "nDoOnce") != 1)
    {
       // Create the healing statues.
       int x = 1;
       object oRod = GetNearestObjectByTag("q4a_golem_invis", oPC, x);

       while(oRod != OBJECT_INVALID) {
          ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_MAGIC_RESISTANCE), oRod);
          x = x + 1;
          oRod = GetNearestObjectByTag("q4a_golem_invis", oPC, x);
       }
       }
   }
}

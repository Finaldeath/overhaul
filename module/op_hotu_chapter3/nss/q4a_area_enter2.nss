//::///////////////////////////////////////////////
//:: Name: q4a_area_enter2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script will create the healing rods
    and apply effects to them.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Jan 3, 2003
//:://////////////////////////////////////////////
void MakeGlow(object oPC);

void main()
{

    object oPC = GetEnteringObject();

    if(GetIsPC(oPC)) {
    // Do once
    if (GetLocalInt(OBJECT_SELF, "nDoOnce") != 1)
    {
       // Create the healing statues.
       int x = 1;
       object oRod = GetNearestObjectByTag("q4a_heal_wp", oPC, x);

       while(oRod != OBJECT_INVALID) {
          CreateObject(OBJECT_TYPE_PLACEABLE, "birdbath001", GetLocation(oRod));
          x = x + 1;
          oRod = GetNearestObjectByTag("q4a_heal_wp", oPC, x);
       }
       DelayCommand(2.0, MakeGlow(oPC));
       }
   }
}

// Adds an anti-glow around the heal rods.
void MakeGlow(object oPC) {
       int x = 1;
       object oRod = GetNearestObjectByTag("q4a_heal_rod", oPC, x);

       while(oRod != OBJECT_INVALID) {
          ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_ANTI_LIGHT_10), oRod);
          x = x + 1;
          oRod = GetNearestObjectByTag("q4a_heal_rod", oPC, x);
       }
}

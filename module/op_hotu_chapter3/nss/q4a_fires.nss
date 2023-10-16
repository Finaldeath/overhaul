//::///////////////////////////////////////////////
//:: Name q4a_fires
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This script will have random fire effects
     going off to give some life to the lava
     tiles that are spawned in.

     This goes on the heartbeat of the invisible
     fire object.

     The objects tags should be "q4a_fire_xx",
     where xx is a number from 11 - 99.  This will
     allow the script to properly pick the targets.
     Always start with an odd number and end with an
     even one.

     Odd numbers will have their targets as the next
     number in line. Even will have the previous
     number.

     Example: "q4a_fire_11" will have its target as
     "q4a_fire_12", whereas "q4a_fire_12" will have
     "q4a_fire_11" as its target.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Jan 6, 2003
//:://////////////////////////////////////////////

void main()
{
   string sSelf = GetTag(OBJECT_SELF);
   string sTemp = GetStringRight(sSelf, 2);
   // Get the remainder to see if the number is even or odd.
   int iTarget = StringToInt(sTemp);
   int iTemp = iTarget % 2;
   // Random chance of it firing.
   int iRandom = Random(100);
   // Random delay
   int iDelay = 0;
   iDelay = Random(6) + 1;
   float fDelay = IntToFloat(iDelay);

   // If it is even, the target will become the previous one.
   if(iTemp == 0)
      iTarget = iTarget - 1;
   else
      iTarget = iTarget + 1;

   if(iRandom > 75) {
      DelayCommand(fDelay, ActionCastFakeSpellAtObject(SPELL_FIREBALL, GetNearestObjectByTag("q4a_fire_" +
                                  IntToString(iTarget)), PROJECTILE_PATH_TYPE_BALLISTIC));

      DelayCommand(fDelay + 1.4, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_FLAME_M), GetNearestObjectByTag("q4a_fire_" +
                                  IntToString(iTarget))));
   }
}

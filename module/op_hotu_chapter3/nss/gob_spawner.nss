////////////////////////////////////////////////////////////////////////////////////////
// This is the heartbeat script for the goblin spawning machines. When the machine is
// turned on, the hearbeat will kick in and start pumping out goblin creations. When
// it is turned off, it will stop.
//
// Created by: Brad Prince
// 9-13-02
//
////////////////////////////////////////////////////////////////////////////////////////

void main()
{
   object oSpawner = OBJECT_SELF;
   location lLoc = GetLocation(oSpawner);
   int iInt = GetLocalInt(OBJECT_SELF, "start");

   if(iInt == 1) {
      CreateObject(OBJECT_TYPE_CREATURE, "exploding_goblin", lLoc);
      ApplyEffectToObject( DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_STRIKE_HOLY), OBJECT_SELF);
   }
}

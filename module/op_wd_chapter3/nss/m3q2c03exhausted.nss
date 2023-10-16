// * sets this global when the encounter is exhausted
void main()
{
   if (GetEncounterActive(OBJECT_SELF) == TRUE)
   {

     //  * if global is already set then just exit.
    if (GetLocalInt(GetModule(),"NW_G_M3Q02TALKUTHGARDTATTACK") == 1)
      return;
    object oNearestGoodGuy = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
            // * is there an enemy near the player, if not then set the attack done
           object oBadGuy = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, oNearestGoodGuy);
           if ( (GetDistanceToObject(oBadGuy)>12.0) || (!GetIsObjectValid(oBadGuy)))
           {
           SetEncounterActive(FALSE, OBJECT_SELF)  ;

           SetLocalInt(GetModule(),"NW_G_M3Q02TALKUTHGARDTATTACK",1);
           object oNearestGuard = GetObjectByTag("M3Q2A10_ALLY");
           if (GetIsObjectValid(oNearestGuard) == TRUE)
           {
            AssignCommand(oNearestGuard, SpeakOneLinerConversation("",oNearestGoodGuy));
           }
       DestroyObject(OBJECT_SELF);
       }
   }
}


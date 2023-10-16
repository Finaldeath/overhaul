//  * while fire elemental spawn points
// * exist, he'll try and activate them, else fight
#include "nw_i0_generic"
void main()
{
    ClearAllActions();
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
   if (GetIsObjectValid(oPC) == FALSE)
   {
    return;

   }
    if (GetDistanceToObject(oPC) < 20.0)
    {
    //M3Q04G16_Fire
    object oFire = GetNearestObjectByTag("M3Q04G16_Fire");
  //  SpeakString("here");
    if (GetIsObjectValid(oFire) == TRUE)
    {
        SpeakOneLinerConversation();

        ActionAttack(oFire);
        //ActionDoCommand(ClearAllActions());

    }
    else
    {
    //    SpeakString("DCR");
        DetermineCombatRound(GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC));
    }
    }
}

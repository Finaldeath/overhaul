//:://////////////////////////////////////////////////
//:: q1d_spn_kobold
/*
 * Kobolds int the Bubbling Cauldron should have user defined
   on spell cast event and on attacked events to switch their
   faction to hostile if the PC attacks them...
 */
//:://////////////////////////////////////////////////
//:: Keith Warner
//:: Feb 7/03
//:://////////////////////////////////////////////////


#include "x0_i0_walkway"
#include "x0_i0_treasure"

void main()
{

    SetSpawnInCondition(NW_FLAG_IMMOBILE_AMBIENT_ANIMATIONS);
    SetSpawnInCondition(NW_FLAG_HEARTBEAT_EVENT);   //Event 1001
    // * Fire User Defined Event 1005
    // *
     SetSpawnInCondition(NW_FLAG_ATTACK_EVENT);



     //SetSpawnInCondition(NW_FLAG_SPELL_CAST_AT_EVENT);
     SetSpawnInCondition(NW_FLAG_DEATH_EVENT); // Event 1007





    //* Create a small amount of treasure on the creature
    CTG_GenerateNPCTreasure(TREASURE_TYPE_MONSTER, OBJECT_SELF);


    // ***** ADD ANY SPECIAL ON-SPAWN CODE HERE ***** //

}






//::///////////////////////////////////////////////
//:: Name bat2_spawnevil
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC has betrayed the rebels so spawns in at
    the head of the attacking force.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Sept 4/03
//:://////////////////////////////////////////////

void main()
{

    location lSpawn = GetLocation(GetWaypointByTag("wp_q2abattle2_evilstart"));
    //Create the 'evil' herald who can brief the PC on the battle.
    //The PC will not control the evil troops, per-se - he's just along for the ride.
    object oEvilHerald = CreateObject(OBJECT_TYPE_CREATURE, "q2aevilherald", lSpawn);
    ChangeToStandardFaction(oEvilHerald, STANDARD_FACTION_COMMONER);
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, oEvilHerald);
    AssignCommand(oPC, ClearAllActions(TRUE));
    SetLocalInt(oEvilHerald, "nTalkToPC", 1);

    DelayCommand(1.0, AssignCommand(oEvilHerald, ActionStartConversation(oPC)));
    //Spawn in the defending troops

    ExecuteScript("bat2_spawndef2", OBJECT_SELF); //OBJECT_SELF should be the Battlemaster
    //Spawn in attacking forces during conversation with the PC..



}

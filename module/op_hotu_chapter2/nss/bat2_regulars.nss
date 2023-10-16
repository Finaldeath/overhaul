//::///////////////////////////////////////////////
//:: Name bat2_regulars
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script spawns in the regular attackers for
    battle 2
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Sept 9/03
//:://////////////////////////////////////////////
#include "x2_inc_globals"
#include "nw_i0_generic"

void CreateUndead(location lSpawn, object oTarget);
void SpawnGroupAt(int nFormation, string szResRef, object oTarget, location lSpawn);
void SetFormation(int nFormation, string szResRef);
void CreateCaster(string szResRef, object oTarget, location lSpawn);

void main()
{

    object oSeer = GetObjectByTag("q2aseer");
    //Spawn in regular drow attackers

    //if the PC lost Battle1 - the Matron will have Duergar in her army.
    ////Both of the following troops will enter the Core via the Entrance to the Environs.
    //bat2wp_bat1armyspawn
    if (GetLocalInt(GetModule(), "X2_Q2aBattle1Lost") == 1)
    {
        string szDuergar = "q2a_bat2_duer1";
        string szDuergar2 = "q2a_bat2_duer2";
        object oOuterSpawn = GetWaypointByTag("bat2wp_bat1armyspawn");
        SpawnGroupAt(1, szDuergar, oSeer, GetLocation(oOuterSpawn));
        SpawnGroupAt(2, szDuergar2, oSeer, GetLocation(oOuterSpawn));
        //if the PC lost Battle 1 - and the Matron had undead in her army - the
        //Matron will still have undead in her army.
        //
        if (GetGlobalInt("x2_plot_undead_out") == 0)
        {
            string szBoneGolem = "q2a_bat2_undead4";
            DelayCommand(6.0, CreateUndead(GetLocation(oOuterSpawn), oSeer));

        }
    }
    //if the PC won battle 1 - the Matron will have neither undead or Duergar.

    //the Matron will always have Drow troops for this battle.
    //bat2wp_drowspawn1-5
    //bat2wp_portspawn
    //First Group of Drow will spawn in at the port entrance
    object oPortSpawn = GetWaypointByTag("bat2wp_portspawn");
    string szDrow1 = "q2a_bat2_drow1";
    string szDrow2 = "q2a_bat2_drow2";
    string szPriest = "q2a_bat2_priest1";
    string szWiz = "q2a_bat2_wiz1";

    SpawnGroupAt(4, szDrow1, oSeer, GetLocation(oPortSpawn));
    DelayCommand(6.0, SpawnGroupAt(5, szDrow1, oSeer, GetLocation(oPortSpawn)));
    DelayCommand(12.0, SpawnGroupAt(6, szDrow2, oSeer, GetLocation(oPortSpawn)));
    DelayCommand(6.0, CreateCaster(szPriest, oSeer, GetLocation(oPortSpawn)));
    DelayCommand(6.0, CreateCaster(szWiz, oSeer, GetLocation(oPortSpawn)));

}

void CreateUndead(location lSpawn, object oTarget)
{
    string szBoneGolem = "q2a_bat1_undead4";

    object oGolem1 = CreateObject(OBJECT_TYPE_CREATURE, szBoneGolem, lSpawn, FALSE, "bat2_undead1");
    //object oGolem2 = CreateObject(OBJECT_TYPE_CREATURE, szBoneGolem, lSpawn, FALSE, "bat1_undead2");

    DelayCommand(2.0, SignalEvent(oGolem1, EventUserDefined(500)));

}
void SpawnGroupAt(int nFormation, string szResRef, object oTarget, location lSpawn)
{
    //object oPC = GetFirstPC();
    if (GetIsObjectValid(oTarget) == FALSE)
        oTarget = GetObjectByTag("q2ainnergate");
    object oBattleMaster = GetObjectByTag("bat1_battlemaster");
    //Track how many Drow formations have been created (for retreat purposes)

    SetLocalInt(oBattleMaster, "nBattle1DrowFormCount", GetLocalInt(oBattleMaster, "nBattle1DrowFormCount") + 1);

    //location lSpawn = GetLocation(GetWaypointByTag("wp_bat1_drowspawn" + IntToString(Random(3) + 1)));
    int nCount;
    object oCreature;
    for (nCount = 1; nCount < 6; nCount++)
    {
        oCreature = CreateObject(OBJECT_TYPE_CREATURE, szResRef, lSpawn, FALSE, szResRef + IntToString(nFormation) + IntToString(nCount));
        if (nCount == 1)
        {
            //Store a pointer to the leader of each group on the battlemaster
            SetLocalObject(oBattleMaster, "oFormationLeader" + IntToString(nFormation), oCreature);

            SetLocalInt(oCreature, "nLeader", 1);                     //ADVANCE
            DelayCommand(2.0, SignalEvent(oCreature, EventUserDefined(5000)));
        }
        SetLocalInt(oCreature, "nFormation", nFormation);
        SetLocalObject(oCreature, "oTarget", oTarget);
        //SendMessageToPC(oPC, GetTag(oCreature));
    }
    SetFormation(nFormation, szResRef);
}
void SetFormation(int nFormation, string szResRef)
{
//    all members of the formation will have pointers to all other members stored locally
    object oPC = GetFirstPC();
    int nCount = 1;
    int nCount2 = 1;
    object oFormMember;
    object oPointer;
    for (nCount = 1; nCount < 6; nCount++)
    {
        oFormMember = GetObjectByTag(szResRef + IntToString(nFormation) + IntToString(nCount));
        //SendMessageToPC(oPC, "oFormMember" + IntToString(nCount) + " gets:");

        for (nCount2 = 1; nCount2 < 6; nCount2++)
        {
            oPointer = GetObjectByTag(szResRef + IntToString(nFormation) + IntToString(nCount2));
            SetLocalObject(oFormMember, "oFormMember" + IntToString(nCount2), oPointer);
            //SendMessageToPC(oPC, GetTag(oPointer));
        }
    }

}

//Create a Single creature
void CreateCaster(string szResRef, object oTarget, location lSpawn)
{
    object oCaster = CreateObject(OBJECT_TYPE_CREATURE, szResRef, lSpawn);
    SetLocalObject(oCaster, "oTarget", oTarget);
    AssignCommand(oCaster, DetermineCombatRound());
    DelayCommand(6.0, SignalEvent(oCaster, EventUserDefined(5000)));

}

//::///////////////////////////////////////////////
//:: Name bat2_spawnatk2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

    Spawn the attackers in..for Battle 2 (to kill the Seer)
    In this case - the attackers are on the PCs side - the
    PC has betrayed the rebels in battle 1.

*/
//:://////////////////////////////////////////////
//:: Created By:  Keith Warner
//:: Created On:  August 27/03
//:://////////////////////////////////////////////

#include "x2_inc_globals"
#include "nw_i0_generic"

void CreateAttacker(string szResRef, location lSpawn);
void CreateFlyer(string szResRef, object oTarget, location lSpawn);
void RockEffects(location lSpawn1);



void main()
{
    object oPC = GetPCSpeaker();
    object oArea = GetArea(oPC);

    if (GetLocalInt(oArea, "nSpawnedAttack") == 1)
        return;
    SetLocalInt(oArea, "nSpawnedAttack", 1);

    //Change Ambient sounds in the area
    AmbientSoundChangeDay(oArea, 24);
    AmbientSoundChangeNight(oArea, 24);
    AmbientSoundPlay(oArea);

    object oSeer = GetObjectByTag("q2aseer");

    //WAVE 1  - Further Waves controlled by the Battlemaster's User Defined Script

    //the PC has betrayed the rebels - so Duergar will be in his army - the Matron will have Duergar in her army.
    ////Both of the following troops will enter the Core via the Entrance to the Environs.
    //bat2wp_bat1armyspawn


        location  lOuterSpawn = GetLocation(GetWaypointByTag("bat2wp_wave2spawn3"));
        //Spawn in soldiers
        CreateAttacker("q2a_bat2_duer2", lOuterSpawn);
        //DelayCommand(1.0, CreateAttacker("q2a_bat2_duer2", lOuterSpawn));
        DelayCommand(2.0, CreateAttacker("q2a_bat2_duer1", lOuterSpawn));
        //DelayCommand(3.0, CreateAttacker("q2a_bat2_duer1", lOuterSpawn));
        DelayCommand(4.0, CreateAttacker("q2a_bat2_duer2", lOuterSpawn));
        DelayCommand(5.0, CreateAttacker("q2a_bat2_duer1", lOuterSpawn));
        DelayCommand(6.0, CreateAttacker("q2a_bat2_duer2", lOuterSpawn));


    //the Matron will always have Drow troops for this battle.

    CreateAttacker("bat2_drow1", lOuterSpawn);
    CreateAttacker("bat2_drow1", lOuterSpawn);

    CreateAttacker("bat2_drow2", lOuterSpawn);
    CreateAttacker("bat2_drow2", lOuterSpawn);

    //The Matron will have beholders unless x2_plot_beholders_out has been set to 1
    //bat2wp_beholderspawn1-5
    if (GetGlobalInt("x2_plot_beholders_out") == 0)
    {
        string szBeholder = "q2a_bat2_beh1";
        string szBeholderMage = "q2a_bat2_beh2";
        string szEyeball = "q2a_bat2_beh3";
        string szSpawn = "bat2wp_beholderspawn";

        location lFlyIn = GetLocation(GetWaypointByTag("bat2wp_wave2spawn1"));
        //Create an initial wave of beholders - 2 at 2 different spawn points
        //DelayCommand(5.0, CreateFlyer(szEyeball, oSeer, lFlyIn));
        DelayCommand(14.0, CreateFlyer(szEyeball, oSeer, lFlyIn));
        DelayCommand(16.0, CreateFlyer(szEyeball, oSeer, lFlyIn));
        DelayCommand(18.0, CreateFlyer(szBeholder, oSeer, lFlyIn));
        DelayCommand(20.0, CreateFlyer(szBeholder, oSeer, lFlyIn));
        DelayCommand(22.0, CreateFlyer(szBeholderMage, oSeer, lFlyIn));

    }
    //The Matron will have Illithid and Umber Hulks unless X2_Q2DOvermind < 2
   //bat2wp_mindflayerspawn1-5
    if (GetGlobalInt("X2_Q2DOvermind") < 2)
    {
        string szIllithid = "q2a_bat2_mf1";
        string szUmberHulk = "q2a_bat2_mf2";
        location lHole = GetLocation(GetWaypointByTag("bat2wp_wave2spawn2"));

        //Create an initial wave of mindflayer groups - 2 at 2 different spawn points
        DelayCommand(12.0, RockEffects(lHole));

        DelayCommand(14.0, CreateAttacker(szUmberHulk, lHole));
        DelayCommand(16.0, CreateAttacker(szUmberHulk, lHole));
        DelayCommand(18.0, CreateAttacker(szIllithid, lHole));
        DelayCommand(20.0, CreateAttacker(szIllithid, lHole));

    }

    //Keep track of formation count for dynamic squad creation
    SetLocalInt(GetModule(), "X2_Q2ABattle2FormCount", 7 );

    //Set a variable to show that battle 2 is ongoing
    SetLocalInt(GetModule(), "X2_Q2ABattle2Started", 1);

}

//Create a creature that uses the flying animation on spawn in
void CreateFlyer(string szResRef, object oTarget, location lSpawn)
{
    object oSeer = GetObjectByTag("q2aseer");
    object oCaster = CreateObject(OBJECT_TYPE_CREATURE, szResRef, lSpawn, TRUE);
    //Because this is the evil path - change the faction to commoner for all attackers
    ChangeToStandardFaction(oCaster, STANDARD_FACTION_COMMONER);

    SetLocalObject(oCaster, "oTarget", oTarget);
    AssignCommand(oCaster, ActionMoveToObject(oSeer));
    DelayCommand(6.0, SignalEvent(oCaster, EventUserDefined(5000)));
}
//Create the rock effects for the appearance of UmberHulks
void RockEffects(location lSpawn1)
{
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(354), lSpawn1);
    CreateObject(OBJECT_TYPE_PLACEABLE, "x2_plc_hole_b", lSpawn1);
}

void CreateAttacker(string szResRef, location lSpawn)
{
     //The Seer
    object oSeer = GetObjectByTag("q2aseer");
    object oAttacker = CreateObject(OBJECT_TYPE_CREATURE, szResRef, lSpawn);
    ChangeToStandardFaction(oAttacker, STANDARD_FACTION_COMMONER);
    SetLocalObject(oAttacker, "oTarget", oSeer);
    AssignCommand(oAttacker, ActionMoveToObject(oSeer, TRUE));
    DelayCommand(6.0 + IntToFloat(Random(4)), SignalEvent(oAttacker, EventUserDefined(5000)));
}
/*
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
        //Because this is the evil path - change the faction to commoner for all attackers
        ChangeToStandardFaction(oCreature, STANDARD_FACTION_COMMONER);
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
*/

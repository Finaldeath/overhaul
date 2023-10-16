//::///////////////////////////////////////////////
//:: Name q2a_ud_batmaster
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Battle Master User Defined.

    The Battle master controls certain battle events
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 28/03
//:://////////////////////////////////////////////
#include "q2_inc_battle"
#include "x2_inc_globals"
#include "nw_i0_plot"
int CheckGroupCount(object oLeader);
void FindAndAttack(object oCreature);
void CreateUndead();
void SpawnBat1GroupAt(float fDelay, int nFormation, string szResRef, object oTarget, location lSpawn);

void main()
{
    if (GetLocalInt(GetModule(), "X2_Q2ABattle1Started") == 1)
    {
        int nEvent = GetUserDefinedEventNumber();

        //this event should fire when a group that is assaulting the outside gates is
        //totally wiped out...
        if (nEvent == BATTLEMASTER_FIND_NEW_GATE_ATTACKER)
        {
            object oPC = GetFirstPC();
            //SendMessageToPC(oPC, "Trying to find new Gate Attacker");
            //If the city gates have already been destroyed, do nothing.
            object oGate = GetObjectByTag("q2acitygate");
            if (oGate == OBJECT_INVALID)
                oGate = GetObjectByTag("q2ainnergate");
            //How many total formations have been created.
            int nTotalFormCount = GetLocalInt(GetModule(), "X2_Q2ABattle1FormCount");
            object oGroupToCheck, oGroupLeader, oGroupTarget;
            int bFound = FALSE;
            int nCount = 1;
            //Cycle through all the formation leaders stored by the Battlemaster until w
            //find one that hasn't been already assigned to the city gate and make them attack
            for (nCount = 1; nCount <= nTotalFormCount && bFound == FALSE; nCount++)
            {
                //if the chosen formation hasn't been wiped out
                if (GetLocalInt(OBJECT_SELF, "nDeadFormation" + IntToString(nCount)) != 1)
                {
                    oGroupToCheck = GetLocalObject(OBJECT_SELF, "oFormationLeader" + IntToString(nCount));
                    oGroupTarget = GetLocalObject(oGroupToCheck, "oTarget");
                    //Found the new leader
                    if (GetTag(oGroupTarget) != GetTag(oGate))
                    {
                        oGroupLeader = oGroupToCheck;
                        bFound = TRUE;
                        //Signal the new leader to advance his troops
                        SignalEvent(oGroupLeader, EventUserDefined(5001));

                    }
                }
            }
        }
        else if (nEvent == BATTLEMASTER_SIGNAL_RETREAT)
        {
            SetLocalInt(OBJECT_SELF, "nBattle1RetreatSounded", 1);
            //Lets change everybodies faction and make them friends with the PC.
            //Get the PC
            object oHerald = GetObjectByTag("q2aherald");
            object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, oHerald);
            //Create the neutral faction creature
            location lSpawn = GetLocation(GetWaypointByTag("wp_factionboys"));
            object oFactionBoy = CreateObject(OBJECT_TYPE_CREATURE, "x2_factionboy", lSpawn);
            DestroyObject(oFactionBoy, 10.0);

            object oRetreatTo = GetObjectByTag("wp_bat1_retreat");
            string szRetreaterTag;

            object oRetreater = GetFirstObjectInArea();
            while (GetIsObjectValid(oRetreater) == TRUE)
            {
                if (GetObjectType(oRetreater) == OBJECT_TYPE_CREATURE)
                {
                    szRetreaterTag = GetTag(oRetreater);
                    if (GetStringLeft(szRetreaterTag, 9) == "q2a_bat1_")
                    {
                        //change faction and make friends with the PC
                        ChangeFaction(oRetreater, oFactionBoy);
                        SetIsTemporaryFriend(oPC, oRetreater, FALSE);

                        SetLocalInt(oRetreater, "nRetreat", 1);
                        SetLocalObject(oRetreater,"oTarget", oRetreatTo);
                        AssignCommand(oRetreater, ClearAllActions(TRUE));
                        DelayCommand(0.3, AssignCommand(oRetreater, ActionForceMoveToObject(oRetreatTo, TRUE)));
                        DelayCommand(0.6, SetCommandable(FALSE, oRetreater));

                    }

                }
                oRetreater = GetNextObjectInArea();
            }

            //Force the two bone golems to retreat
            object oGolem1 = GetObjectByTag("bat1_undead1");
            object oGolem2 = GetObjectByTag("bat1_undead2");
            if (GetIsObjectValid(oGolem1) == TRUE)
            {
                SetLocalInt(oGolem1, "nRetreat", 1);
                AssignCommand(oGolem1, ClearAllActions(TRUE));
                DelayCommand(0.3, AssignCommand(oGolem1, ActionForceMoveToObject(oRetreatTo, TRUE)));
                //change faction and make friends with the PC
                ChangeFaction(oGolem1, oFactionBoy);
                SetIsTemporaryFriend(oPC, oGolem1, FALSE);

            }
            if (GetIsObjectValid(oGolem2) == TRUE)
            {
                SetLocalInt(oGolem2, "nRetreat", 1);
                AssignCommand(oGolem2, ClearAllActions(TRUE));
                DelayCommand(0.3, AssignCommand(oGolem2, ActionForceMoveToObject(oRetreatTo, TRUE)));
                //change faction and make friends with the PC
                ChangeFaction(oGolem2, oFactionBoy);
                SetIsTemporaryFriend(oPC, oGolem2, FALSE);
            }

            //Get rid of any summoned outsiders
            object oOutsider1 = GetObjectByTag("q2abat1_out1");
            object oOutsider2 = GetObjectByTag("q2abat1_out2");
            object oOutsider3 = GetObjectByTag("q2abat1_out3");
            effect eUnsummon = EffectVisualEffect(VFX_IMP_UNSUMMON);
            if (GetIsObjectValid(oOutsider1) == TRUE)
            {
                ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eUnsummon, GetLocation(oOutsider1));
                DestroyObject(oOutsider1);
            }
            if (GetIsObjectValid(oOutsider2) == TRUE)
            {
                ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eUnsummon, GetLocation(oOutsider2));
                DestroyObject(oOutsider2);
            }
            if (GetIsObjectValid(oOutsider3) == TRUE)
            {
                ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eUnsummon, GetLocation(oOutsider3));
                DestroyObject(oOutsider3);
            }

            //Priest - MU and General all pack up and head for home
            object oPriest = GetObjectByTag("bat1_drowpriest");
            if (GetIsObjectValid(oPriest) == TRUE)
            {
                SetLocalInt(oPriest, "nRetreat", 1);
                AssignCommand(oPriest, ClearAllActions(TRUE));
                DelayCommand(0.3, AssignCommand(oPriest, ActionForceMoveToObject(oRetreatTo, TRUE)));
                //change faction and make friends with the PC
                ChangeFaction(oPriest, oFactionBoy);
                SetIsTemporaryFriend(oPC, oPriest, FALSE);
            }
            object oWiz = GetObjectByTag("q2abat1_wiz1");
            if (GetIsObjectValid(oWiz) == TRUE)
            {
                effect eVis1 = EffectVisualEffect(VFX_FNF_WORD);
                effect eVis2 = EffectVisualEffect(VFX_IMP_DEATH);
                effect eLink = EffectLinkEffects(eVis1, eVis2);

                SetLocalInt(oWiz, "nRetreat", 1);
                AssignCommand(oWiz, ClearAllActions(TRUE));
                DelayCommand(0.3, AssignCommand(oWiz, ActionForceMoveToObject(oRetreatTo, TRUE)));
                //change faction and make friends with the PC
                ChangeFaction(oWiz, oFactionBoy);
                SetIsTemporaryFriend(oPC, oWiz, FALSE);
                //Teleport the wizard away
                ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eLink, GetLocation(oWiz));
                DestroyObject(oWiz, 1.0);
            }
            object oGeneral = GetObjectByTag("x2_q2drowcom");
            if (GetIsObjectValid(oGeneral) == TRUE)
            {
                SetLocalInt(oGeneral, "nRetreat", 1);
                AssignCommand(oGeneral, ClearAllActions(TRUE));
                DelayCommand(0.3, AssignCommand(oGeneral, ActionForceMoveToObject(oRetreatTo, TRUE)));
                //change faction and make friends with the PC
                ChangeFaction(oGeneral, oFactionBoy);
                SetIsTemporaryFriend(oPC, oGeneral, FALSE);
            }
            object oGuard1 = GetObjectByTag("q2a_bat1_guard1");
            if (GetIsObjectValid(oGuard1) == TRUE)
            {
                SetLocalInt(oGuard1, "nRetreat", 1);
                AssignCommand(oGuard1, ClearAllActions(TRUE));
                DelayCommand(0.3, AssignCommand(oGuard1, ActionForceMoveToObject(oRetreatTo, TRUE)));
                //change faction and make friends with the PC
                ChangeFaction(oGuard1, oFactionBoy);
                SetIsTemporaryFriend(oPC, oGuard1, FALSE);
            }
            object oGuard2 = GetObjectByTag("q2a_bat1_guard2");
            if (GetIsObjectValid(oGuard2) == TRUE)
            {
                SetLocalInt(oGuard2, "nRetreat", 1);
                AssignCommand(oGuard2, ClearAllActions(TRUE));
                DelayCommand(0.3, AssignCommand(oGuard2, ActionForceMoveToObject(oRetreatTo, TRUE)));
                //change faction and make friends with the PC
                ChangeFaction(oGuard2, oFactionBoy);
                SetIsTemporaryFriend(oPC, oGuard2, FALSE);
            }
            object oGuard3 = GetObjectByTag("q2a_bat1_guard3");
            if (GetIsObjectValid(oGuard3) == TRUE)
            {
                SetLocalInt(oGuard3, "nRetreat", 1);
                AssignCommand(oGuard3, ClearAllActions(TRUE));
                DelayCommand(0.3, AssignCommand(oGuard3, ActionForceMoveToObject(oRetreatTo, TRUE)));
                //change faction and make friends with the PC
                ChangeFaction(oGuard3, oFactionBoy);
                SetIsTemporaryFriend(oPC, oGuard3, FALSE);
            }
            object oGuard4 = GetObjectByTag("q2a_bat1_guard4");
            if (GetIsObjectValid(oGuard4) == TRUE)
            {
                SetLocalInt(oGuard4, "nRetreat", 1);
                AssignCommand(oGuard4, ClearAllActions(TRUE));
                DelayCommand(0.3, AssignCommand(oGuard4, ActionForceMoveToObject(oRetreatTo, TRUE)));
                //change faction and make friends with the PC
                ChangeFaction(oGuard4, oFactionBoy);
                SetIsTemporaryFriend(oPC, oGuard4, FALSE);
            }

            //End Battle Variables
            SetLocalInt(GetModule(), "X2_Q2ABattle1Won", 1);
            SetLocalInt(GetModule(), "X2_Q2ABattle1Started", 2);

            //Play some end of battle sounds
            AssignCommand(oPC, PlaySound("as_cv_eulpipe1"));
            DelayCommand(1.0, AssignCommand(oPC, PlaySound("as_pl_comyaygrp2")));

            DelayCommand(3.0, AssignCommand(oHerald, PlaySpeakSoundByStrRef(85755))); //"They are retreating. We have won the battle."
            DelayCommand(2.0, SetLocalInt(oHerald, "nTalkToPC", 1));
            DelayCommand(4.0, SignalEvent(oHerald, EventUserDefined(101)));
            AssignCommand(oPC, ClearAllActions(TRUE));
            DelayCommand(1.0, AssignCommand(oPC, ClearAllActions(TRUE)));
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectCutsceneImmobilize(), oPC);

        }
        //This event fires when the outer gates fall - All waiting troops should
        //advance towards the inner gates
        else if (nEvent == BATTLEMASTER_SIGNAL_ALL_ADVANCE)
        {
            //Signal more advances (until the retreat is given) so that reinforcements will
            if (GetLocalInt(OBJECT_SELF, "nBattle1RetreatSounded") == 1)
                return;

            DelayCommand(12.0, SignalEvent(OBJECT_SELF, EventUserDefined(BATTLEMASTER_SIGNAL_ALL_ADVANCE)));


            //Get the new target (the inner gate)
            object oPC = GetFirstPC();

            object oGate2 = GetObjectByTag("q2ainnergate");

            //How many total formations have been created.
            int nTotalFormCount = GetLocalInt(OBJECT_SELF, "nBattle1DrowFormCount");
            object oGroupLeader, oGroupMember, oGroupTarget;
            int nCount = 1, nCount2;
            //Cycle through all the formation leaders stored by the Battlemaster until w
            //find one that hasn't been already assigned to the city gate and make them attack
            for (nCount = 1; nCount <= nTotalFormCount; nCount++)
            {
                //if the chosen formation hasn't been wiped out
                if (GetLocalInt(OBJECT_SELF, "nDeadFormation" + IntToString(nCount)) != 1)
                {
                    oGroupLeader = GetLocalObject(OBJECT_SELF, "oFormationLeader" + IntToString(nCount));
                    if (GetStringLeft(GetTag(GetLocalObject(oGroupLeader, "oTarget")), 13) == "q2a_bat1_hole")
                        return;

                    for (nCount2 = 1; nCount2 < 6; nCount2++)
                    {
                        oGroupMember = GetLocalObject(oGroupLeader, "oFormMember" + IntToString(nCount2));
                        if (GetIsObjectValid(oGroupMember) == TRUE)
                        {
                            //Have all members fire their advance to gate script
                            //AssignCommand(oGroupMember, SpeakString("I WAS TOLD TO ADVANCE"));

                            SetLocalObject(oGroupMember,"oTarget", oGate2);

                            FindAndAttack(oGroupMember);//AssignCommand(oGroupMember, ActionMoveToObject(oGate2, TRUE));
                        }
                    }

                }
            }
        }
        else if (nEvent == BATTLEMASTER_RESPAWN_WAVE)
        {

            object oSpawn1 = GetObjectByTag("wp_bat1_drowspawn1");
            object oSpawn2 = GetObjectByTag("wp_bat1_drowspawn2");
            object oSpawn3 = GetObjectByTag("wp_bat1_drowspawn3");
            string szDuergar = "q2a_bat1_duer1";
            string szDuergar2 = "q2a_bat1_duer2";
            string szUndead = "q2a_bat1_undead4";// + IntToString(Random(3) + 1);
            int nFormCount = GetLocalInt(GetModule(), "X2_Q2ABattle1FormCount");
            object oHole1 = GetObjectByTag("q2a_bat1_hole1");
            object oHole2 = GetObjectByTag("q2a_bat1_hole2");
            object oGate1 = GetObjectByTag("q2ainnergate");

            if (GetLocalInt(OBJECT_SELF, "nTimesRespawned") == 0)
            {

                SpawnBat1GroupAt(0.0, nFormCount, szDuergar, oHole1, GetLocation(oSpawn1));
                nFormCount++;
                SpawnBat1GroupAt(5.0, nFormCount, szDuergar, oHole2, GetLocation(oSpawn3));
                nFormCount++;
                SpawnBat1GroupAt(10.0, nFormCount, szDuergar2, oGate1, GetLocation(oSpawn2));
                nFormCount++;

                SetLocalInt(GetModule(), "X2_Q2ABattle1FormCount", nFormCount);
                SetLocalInt(OBJECT_SELF, "nTimesRespawned", 1);
            }
            else
            {
                SpawnBat1GroupAt(0.0, nFormCount, szDuergar, oGate1, GetLocation(oSpawn1));
                nFormCount++;
                SpawnBat1GroupAt(5.0, nFormCount, szDuergar, oGate1, GetLocation(oSpawn3));
                nFormCount++;
                SpawnBat1GroupAt(10.0, nFormCount, szDuergar2, oGate1, GetLocation(oSpawn2));
                nFormCount++;

                SetLocalInt(GetModule(), "X2_Q2ABattle1FormCount", nFormCount);
            }
        }
    }
}

int CheckGroupCount(object oLeader)
{
    int nFormation = GetLocalInt(oLeader, "nFormation");
    string szResRef = GetResRef(oLeader);
    int nCount = 1;
    int nTotal = 0;
    object oGroupMember;
    for (nCount = 1; nCount < 6; nCount++)
    {
        oGroupMember = GetObjectByTag(szResRef + IntToString(nFormation) + IntToString(nCount));
        if (GetIsObjectValid(oGroupMember) && GetIsDead(oGroupMember) == FALSE)
        {
            nTotal++;
        }
    }
    return nTotal;
}

void FindAndAttack(object oCreature)
{
    int bFound = FALSE;
    int nEnemy = 1;
    object oEnemy = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, oCreature, nEnemy, CREATURE_TYPE_IS_ALIVE, TRUE);
    while (oEnemy != OBJECT_INVALID && bFound == FALSE)
    {
        if (GetLocalInt(oEnemy, "Q2A_OnLedge") == 1)
        {
            nEnemy++;
            oEnemy = GetNearestCreature(CREATURE_TYPE_REPUTATION, REPUTATION_TYPE_ENEMY, oCreature, nEnemy, CREATURE_TYPE_IS_ALIVE, TRUE);
        }
        else
        {
            bFound = TRUE;
            AssignCommand(oCreature, ActionAttack(oEnemy));

        }
    }
    if (bFound == FALSE)
    {
        //Signal Gate Bash Event
        object oGate2 = GetObjectByTag("q2ainnergate");
        AssignCommand(oCreature, DoDoorAction(oGate2, DOOR_ACTION_BASH));

    }
}

void CreateUndead()
{
    string szDeathKnight = "q2a_bat1_undead1";
    string szSkelWar = "q2a_bat1_undead2";
    string szSkelArch = "q2a_bat1_undead3";
    string szBoneGolem = "q2a_bat1_undead4";
    object oSpawn1 = GetObjectByTag("wp_bat1_drowspawn1");
    object oSpawn2 = GetObjectByTag("wp_bat1_drowspawn2");
    object oSpawn3 = GetObjectByTag("wp_bat1_drowspawn3");

   //SendMessageToPC(GetFirstPC(), "Spawning Undead");
    //DelayCommand(15.0, SpawnGroupAt(4, szBoneGolem, oTarget, GetLocation(oSpawn1)));
    //DelayCommand(45.0, SpawnGroupAt(11, szSkelWar, oTarget, GetLocation(oSpawn2)));
    //DelayCommand(45.0, SpawnGroupAt(12, szSkelWar, oTarget, GetLocation(oSpawn3)));
    //DelayCommand(50.0, SpawnGroupAt(13, szSkelArch, oTarget, GetLocation(oSpawn2)));
    //DelayCommand(55.0, SpawnGroupAt(14, szDeathKnight, oTarget, GetLocation(oSpawn2)));
    location lSpawn = GetLocation(oSpawn2);
    object oGolem1 = CreateObject(OBJECT_TYPE_CREATURE, szBoneGolem, lSpawn, FALSE, "bat1_undead1");
    object oGolem2 = CreateObject(OBJECT_TYPE_CREATURE, szBoneGolem, lSpawn, FALSE, "bat1_undead2");

    DelayCommand(2.0, SignalEvent(oGolem1, EventUserDefined(500)));
    DelayCommand(2.0, SignalEvent(oGolem2, EventUserDefined(500)));

}

//Just a means of staggering out the reinforcement spawns a bit
void SpawnBat1GroupAt(float fDelay, int nFormation, string szResRef, object oTarget, location lSpawn)
{
    DelayCommand(fDelay, SpawnGroupAt(nFormation, szResRef, oTarget, lSpawn));

}

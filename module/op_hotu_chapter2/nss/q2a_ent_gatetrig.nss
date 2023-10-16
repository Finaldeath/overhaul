//::///////////////////////////////////////////////
//:: Name q2a_ent_gatetrig    //OUTER GATE
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
 On enter of the inner gates trigger - attackers
 will bash the gate...
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 28/03
//:://////////////////////////////////////////////
void SpawnGroup(int nFormation, string szResRef, object oTarget);
void SetFormation(int nFormation, string szResRef);
void main()
{

    object oAttacker = GetEnteringObject();

    if (GetLocalInt(oAttacker, "nRetreat") == 1)
        return;

    //if the OUTER gate is not there - do nothing
    object oGate = GetObjectByTag("q2acitygate");

    if (GetIsObjectValid(oGate) == FALSE)
        return;


    string szTag = GetTag(oAttacker);
    if (szTag == "q2a_bat1_duer1" || szTag == "x2_q2drowwarrio2" || GetStringLeft(szTag, 8) == "q2a_bat1")
    {
        //Do not move golems
        if (GetRacialType(oAttacker) == RACIAL_TYPE_CONSTRUCT)
            return;
        //SendMessageToPC(GetFirstPC(), "TriggerEntered by : " + GetName(oAttacker));
        SetLocalInt(oAttacker, "nOuterGateAttack", 1);
        SetLocalObject(oAttacker, "oTarget", oGate);
        //AssignCommand(oAttacker, ClearAllActions(TRUE));
        AssignCommand(oAttacker, DoDoorAction(oGate, DOOR_ACTION_BASH));
        DelayCommand(6.0, SignalEvent(oAttacker, EventUserDefined(5001)));//Bash Gate

    }
}
void SpawnGroup(int nFormation, string szResRef, object oTarget)
{
    object oPC = GetFirstPC();
    object oBattleMaster = GetObjectByTag("bat1_battlemaster");
    //Track how many Drow formations have been created (for retreat purposes)

    SetLocalInt(oBattleMaster, "nBattle1DrowFormCount", GetLocalInt(oBattleMaster, "nBattle1DrowFormCount") + 1);

    location lSpawn = GetLocation(GetWaypointByTag("wp_bat1_drowspawn" + IntToString(Random(3) + 1)));
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


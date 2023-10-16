//::///////////////////////////////////////////////
//:: Name q2bn_ent_dartmst1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    On enter of this encounter - deactivate the other
    dartmaster encounter - spawn in more patrolling
    dart masters.
    Delay a spawn of reinforcement dartmasters...
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: June 18/03
//:://////////////////////////////////////////////
void SendReinforcements(object oPC);

void main()
{
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == FALSE)
        return;
    if (GetLocalInt(OBJECT_SELF, "nTriggered") == 1)
        return;

    SetLocalInt(OBJECT_SELF, "nTriggered", 1);

    string szEncTag;
    if (GetStringRight(GetTag(OBJECT_SELF), 1) == "a")
        szEncTag = "q2bn_dartmaster1b";
    else
        szEncTag = "q2bn_dartmaster1a";
    object oOtherEncounter = GetObjectByTag(szEncTag);
    SetEncounterActive(FALSE, oOtherEncounter);

    object oSpawnTarget = GetObjectByTag("wp_" + szEncTag);
    object oMaster1 = CreateObject(OBJECT_TYPE_CREATURE, "x2_q2orc1", GetLocation(oSpawnTarget));
    object oMaster2 = CreateObject(OBJECT_TYPE_CREATURE, "x2_q2orc1", GetLocation(oSpawnTarget));
    object oMaster3 = CreateObject(OBJECT_TYPE_CREATURE, "x2_q2orc1", GetLocation(oSpawnTarget));

    object oPatrolPoint1 = GetWaypointByTag("wp_q2bn_dartmaster1_patrol1");
    object oPatrolPoint2 = GetWaypointByTag("wp_q2bn_dartmaster1_patrol2");
    AssignCommand(oMaster1, ActionMoveToObject(oPatrolPoint1));
    AssignCommand(oMaster2, ActionMoveToObject(oPatrolPoint1));
    AssignCommand(oMaster3, ActionMoveToObject(oPatrolPoint2));

    object oModule = GetModule();
    AssignCommand(oModule, DelayCommand(20.0, SendReinforcements(oPC)));
}

void SendReinforcements(object oPC)
{
    object oDoor = GetObjectByTag("at_q2bn_east_q2bcentral");
    AssignCommand(oDoor, ActionOpenDoor(oDoor));

    object oSpawnTarget = GetObjectByTag("wp_q2bn_dartmaster1b");
    object oOgre1 = CreateObject(OBJECT_TYPE_CREATURE, "x2_q2ogre1", GetLocation(oSpawnTarget));
    object oOgre2 = CreateObject(OBJECT_TYPE_CREATURE, "x2_q2ogre1", GetLocation(oSpawnTarget));
    object oOgre3 = CreateObject(OBJECT_TYPE_CREATURE, "x2_q2ogre2", GetLocation(oSpawnTarget));

    AssignCommand(oOgre1, ActionMoveToObject(oPC, TRUE, 10.0));
    AssignCommand(oOgre2, ActionMoveToObject(oPC, TRUE, 10.0));
    AssignCommand(oOgre3, ActionMoveToObject(oPC, TRUE, 10.0));

}

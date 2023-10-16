//::///////////////////////////////////////////////
//:: Name q2bc_ent_drowam1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    On enter of this encounter - deactivate the other
    drow encounter - spawn in more patrolling
    drow.
    Delay a spawn of reinforcement dartmasters...
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: June 18/03
//:://////////////////////////////////////////////
void SendReinforcements(object oPC, string szReinforce);

void main()
{
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == FALSE)
        return;
    if (GetLocalInt(OBJECT_SELF, "nTriggered") == 1)
        return;

    SetLocalInt(OBJECT_SELF, "nTriggered", 1);

    string szEncTag;
    string szReinforceTag;
    if (GetStringRight(GetTag(OBJECT_SELF), 1) == "a")
    {
        szEncTag = "q2bc_drowambush1b";
        szReinforceTag = "wp_q2bc_drowambush1a";
    }
    else
    {
        szEncTag = "q2bc_drowambush1a";
        szReinforceTag = "wp_q2bc_drowambush1b";
    }
    object oOtherEncounter = GetObjectByTag(szEncTag);
    DestroyObject(oOtherEncounter);

    object oSpawnTarget = GetObjectByTag("wp_" + szEncTag);
    object oDrow1 = CreateObject(OBJECT_TYPE_CREATURE, "x2_q2drowwar1", GetLocation(oSpawnTarget));

    object oDrow2 = CreateObject(OBJECT_TYPE_CREATURE, "x2_q2drowwar1", GetLocation(oSpawnTarget));

    object oDrow3 = CreateObject(OBJECT_TYPE_CREATURE, "x2_q2drowwiz1", GetLocation(oSpawnTarget));
   //object oMaster3 = CreateObject(OBJECT_TYPE_CREATURE, "x2_q2orc1", GetLocation(oSpawnTarget));

    object oPatrolPoint1 = GetNearestObjectByTag("wp_q2bcdrow1_post1", oSpawnTarget, 1);
    //object oPatrolPoint2 = GetNearestObjectByTag("wp_q2bcdrow1_post2", oSpawnTarget, 2);
    AssignCommand(oDrow1, ActionMoveToObject(oPatrolPoint1));
    AssignCommand(oDrow2, ActionMoveToObject(oPatrolPoint1));
    AssignCommand(oDrow3, ActionMoveToObject(oPatrolPoint1));



    object oModule = GetModule();
    AssignCommand(oModule, DelayCommand(14.0, SendReinforcements(oPC, szReinforceTag)));
}

void SendReinforcements(object oPC, string szReinforce)
{
    //object oDoor = GetObjectByTag("at_q2bn_east_q2bcentral");
    //AssignCommand(oDoor, ActionOpenDoor(oDoor));

    object oSpawnTarget = GetObjectByTag(szReinforce);
    object oDrow1 = CreateObject(OBJECT_TYPE_CREATURE, "x2_q2drowarcher1", GetLocation(oSpawnTarget));

    object oDrow2 = CreateObject(OBJECT_TYPE_CREATURE, "x2_q2drowarcher1", GetLocation(oSpawnTarget));
    object oDrow3 = CreateObject(OBJECT_TYPE_CREATURE, "x2_q2drowpriest1", GetLocation(oSpawnTarget));

    AssignCommand(oDrow1, ActionMoveToObject(oPC, TRUE, 10.0));
    AssignCommand(oDrow2, ActionMoveToObject(oPC, TRUE, 10.0));
    AssignCommand(oDrow3, ActionMoveToObject(oPC, TRUE, 10.0));

}

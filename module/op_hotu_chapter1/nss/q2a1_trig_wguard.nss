//::///////////////////////////////////////////////
//:: Name: q2a1_trig_wguard
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    When the PC first leaves the yawning portal - the
    warning guard will run up and ask for the PCs
    help in clearing the surrounding area of more intruders.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Nov 27/02
//:://////////////////////////////////////////////


void main()
{
    if (GetLocalInt(OBJECT_SELF, "nTriggered") != 1)
    {
        object oPC = GetEnteringObject();
        if (GetIsPC(oPC))
        {
            SetLocalInt(OBJECT_SELF, "nTriggered", 1);
            object oGuard = GetObjectByTag("q2a1_warningguard");
            AssignCommand(oGuard, ActionMoveToObject(oPC, TRUE));
            AssignCommand(oGuard, ActionPlayAnimation(ANIMATION_FIREFORGET_SALUTE));
            AssignCommand(oGuard, ActionUnequipItem(GetItemPossessedBy(oGuard, "NW_ARHE004")));
            AssignCommand(oGuard, ActionStartConversation(oPC));

            //Spawn in a commoner group by the western guard post
            location lSpawn1 = GetLocation(GetWaypointByTag("wp_q2a1_commoner1"));
            location lSpawn2 = GetLocation(GetWaypointByTag("wp_q2a1_commoner2"));
            location lSpawn3 = GetLocation(GetWaypointByTag("wp_q2a1_commoner3"));
            location lSpawn4 = GetLocation(GetWaypointByTag("wp_q2a1_commoner4"));
            location lSpawn5 = GetLocation(GetWaypointByTag("wp_q2a1_commoner5"));

            CreateObject(OBJECT_TYPE_CREATURE, "q2a1_commoner1", lSpawn1, FALSE, "q2acitizen1" );
            CreateObject(OBJECT_TYPE_CREATURE, "q2a1_commoner2", lSpawn2, FALSE, "q2acitizen2");
            CreateObject(OBJECT_TYPE_CREATURE, "q2a1_commoner3", lSpawn3, FALSE, "q2acitizen3");
            CreateObject(OBJECT_TYPE_CREATURE, "q2a1_commoner3", lSpawn4, FALSE, "q2acitizen4");
            CreateObject(OBJECT_TYPE_CREATURE, "q2a1_commoner2", lSpawn5, FALSE, "q2acitizen5");
        }
    }
}

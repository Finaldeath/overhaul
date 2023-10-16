//::///////////////////////////////////////////////
//:: Name q7a_ent_wolftrig
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Spawn in 2 wolves and a worg to fight the
    cave bear..
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: April 15/03
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void main()
{
    if (GetLocalInt(OBJECT_SELF, "nTriggered") == 1)
    {
        if (GetIsObjectValid(GetObjectByTag("q7abear")) == TRUE)
        {

            SetIsTemporaryEnemy(GetObjectByTag("q7abear"), GetEnteringObject());
            SetIsTemporaryEnemy(GetEnteringObject(), GetObjectByTag("q7abear"));
        }
        return;
    }
    object oPC = GetEnteringObject();
    if (GetIsPlayerCharacter(oPC) == TRUE)
    {
        SetLocalInt(OBJECT_SELF, "nTriggered", 1);
        object oWay1 = GetWaypointByTag("q7a_wolf_1");
        object oWay2 = GetWaypointByTag("q7a_wolf_2");
        object oWay3 = GetWaypointByTag("q7a_wolf_3");
        object oBear = GetObjectByTag("q7abear");

        //damage the bear
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(20), oBear);
        //create the wolves
        object oWolf1 = CreateObject(OBJECT_TYPE_CREATURE, "nw_wolf", GetLocation(oWay1));
        object oWolf2 = CreateObject(OBJECT_TYPE_CREATURE, "nw_wolf", GetLocation(oWay2));
        object oWorg = CreateObject(OBJECT_TYPE_CREATURE, "q1footworg", GetLocation(oWay3));

        //make sure they all hate each other
        SetIsTemporaryEnemy(oWolf1, oBear);
        SetIsTemporaryEnemy(oWolf2, oBear);
        SetIsTemporaryEnemy(oWorg, oBear);
        SetIsTemporaryEnemy(oBear, oWolf1);
        SetIsTemporaryEnemy(oBear, oWolf2);
        SetIsTemporaryEnemy(oBear, oWorg);
        SetIsTemporaryEnemy(oBear, oPC);
        SetIsTemporaryEnemy(oPC, oBear);

        //wolves attack bear.
        AssignCommand(oWolf1, ActionAttack(oBear));
        AssignCommand(oWolf2, ActionAttack(oBear));
        AssignCommand(oWorg, ActionAttack(oBear));

    }
}

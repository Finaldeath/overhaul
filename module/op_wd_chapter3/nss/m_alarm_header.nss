//::///////////////////////////////////////////////
//:: Alarm Header
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This is not a header file actually but a script
    that is executed by the generic patrol-alarm scripts

    Creatures are spawned in at nearest WP_<MyTag>_SPWN waypoint.
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////
void SummonHelp(object oSelf);

void main()
{
    SummonHelp(OBJECT_SELF);
}
void SummonHelp(object oSelf)
{

    string sTag = GetTag(oSelf) ;
    object oWay = GetObjectByTag("WP_" + sTag + "_SPWN");

    if ((sTag == "M3Q2B02OrcGongA") || (sTag=="M3Q2B02OrcGongB"))
    {
        object oAlly  = CreateObject(OBJECT_TYPE_CREATURE, "m3q2b01orcforce", GetLocation(oWay));
        SetLocalObject(oAlly,"NW_L_MY_SUMMONER", oSelf);
        SetLocalLocation(oAlly,"NW_L_MY_SUMMONER_LOCATION", GetLocation(oSelf));
        SetLocalInt(oAlly, "NW_L_ONTHEMOVE",1);

        oAlly  = CreateObject(OBJECT_TYPE_CREATURE, "m3q2b01orcforce", GetLocation(oWay));
        SetLocalObject(oAlly,"NW_L_MY_SUMMONER", oSelf);
        SetLocalLocation(oAlly,"NW_L_MY_SUMMONER_LOCATION", GetLocation(oSelf));
        SetLocalInt(oAlly, "NW_L_ONTHEMOVE",1);

        oAlly  = CreateObject(OBJECT_TYPE_CREATURE, "m3q2b01orcforce", GetLocation(oWay));
        SetLocalObject(oAlly,"NW_L_MY_SUMMONER", oSelf);
        SetLocalLocation(oAlly,"NW_L_MY_SUMMONER_LOCATION", GetLocation(oSelf));
        SetLocalInt(oAlly, "NW_L_ONTHEMOVE",1);

    }
    else
    if (sTag == "M3Q1HOSTILEEL002")
    {
        object oAlly  = CreateObject(OBJECT_TYPE_CREATURE, "m3q1hostileel003", GetLocation(oWay));
        SetLocalObject(oAlly,"NW_L_MY_SUMMONER", oSelf);
        SetLocalLocation(oAlly,"NW_L_MY_SUMMONER_LOCATION", GetLocation(oSelf));
        SetLocalInt(oAlly, "NW_L_ONTHEMOVE",1);

        oAlly  = CreateObject(OBJECT_TYPE_CREATURE, "m3q1hostileel003", GetLocation(oWay));
        SetLocalObject(oAlly,"NW_L_MY_SUMMONER", oSelf);
        SetLocalLocation(oAlly,"NW_L_MY_SUMMONER_LOCATION", GetLocation(oSelf));
        SetLocalInt(oAlly, "NW_L_ONTHEMOVE",1);

        oAlly  = CreateObject(OBJECT_TYPE_CREATURE, "m3q1hostileel003", GetLocation(oWay));
        SetLocalObject(oAlly,"NW_L_MY_SUMMONER", oSelf);
        SetLocalLocation(oAlly,"NW_L_MY_SUMMONER_LOCATION", GetLocation(oSelf));
        SetLocalInt(oAlly, "NW_L_ONTHEMOVE",1);

    }
    else if (sTag == "M3Q2GLizCry2")
    {
       object oAlly  = CreateObject(OBJECT_TYPE_CREATURE, "m3q2g03respond", GetLocation(oWay));
        SetLocalObject(oAlly,"NW_L_MY_SUMMONER", oSelf);
        SetLocalLocation(oAlly,"NW_L_MY_SUMMONER_LOCATION", GetLocation(oSelf));
        SetLocalInt(oAlly, "NW_L_ONTHEMOVE",1);

        oAlly  = CreateObject(OBJECT_TYPE_CREATURE, "m3q2g03respond", GetLocation(oWay));
        SetLocalObject(oAlly,"NW_L_MY_SUMMONER", oSelf);
        SetLocalLocation(oAlly,"NW_L_MY_SUMMONER_LOCATION", GetLocation(oSelf));
        SetLocalInt(oAlly, "NW_L_ONTHEMOVE",1);
    }
    // * Patrol in Obould's Cave
    // *   Brings in Dire Boars
    else if (sTag == "M3Q4B09_PATROL")
    {
        object oDoor = GetNearestObjectByTag("M3Q4B07_DOOR");
        object oSelf = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
        AssignCommand(oDoor,ActionOpenDoor(oDoor));
       AssignCommand(GetNearestObjectByTag("M3Q4DIREBOAR"), ClearAllActions());
       AssignCommand(GetNearestObjectByTag("M3Q4DIREBOAR",OBJECT_SELF,2), ClearAllActions());
       AssignCommand(GetNearestObjectByTag("M3Q4DIREBOAR",OBJECT_SELF,3), ClearAllActions());
       AssignCommand(GetNearestObjectByTag("M3Q4DIREBOAR"), ActionAttack(oSelf));
       AssignCommand(GetNearestObjectByTag("M3Q4DIREBOAR",OBJECT_SELF,2), ActionAttack(oSelf));
       AssignCommand(GetNearestObjectByTag("M3Q4DIREBOAR",OBJECT_SELF,3), ActionAttack(oSelf));
    }
}

//::///////////////////////////////////////////////
//:: Name act_q2bgrovel_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Jump Grovel to his place beside Durnan
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: July 29/03
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(GetModule(),"Grovel",10);
    DestroyObject(OBJECT_SELF, 1.0);

    location lTarget = GetLocation(GetWaypointByTag("wp_q2agrovel_start"));
    object oGrovel = CreateObject(OBJECT_TYPE_CREATURE, "q2bgrovel", lTarget);
    SetLocalInt(oGrovel, "nUpstairs", 1);

}

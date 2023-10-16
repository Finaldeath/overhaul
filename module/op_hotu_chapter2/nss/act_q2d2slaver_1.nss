//::///////////////////////////////////////////////
//:: Name act_q2d2slaver_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    PC has lost the auction, slave goes off with
    one of the other mindflayers and all the auction
    people wander off
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: July 31/03
//:://////////////////////////////////////////////

#include "nw_i0_plot"

void main()
{
    object oSlave = GetObjectByTag("q2dthrall_slave1");
    object oAuction = OBJECT_SELF;
    object oHulk = GetObjectByTag("q2d_ill_hulk");
    object oBid1 = GetObjectByTag("q2d_ill_nur2");
    object oBid2 = GetObjectByTag("q2d_ill_nur3");

    object oTarget1 = GetWaypointByTag("wp_q2d_ill_nur1_exit");
    object oTarget2 = GetWaypointByTag("wp_q2d_ill_nur2_exit");
    object oTarget3 = GetWaypointByTag("wp_q2d_ill_nur3_exit");

    AssignCommand(oBid2, SpeakStringByStrRef(85705));//"Come, thrall."

    DestroyObject(oAuction, 10.0);
    AssignCommand(oAuction, ActionMoveToObject(oTarget1));
    DelayCommand(0.3, SetCommandable(FALSE, oAuction));
    DestroyObject(oHulk, 10.0);
    AssignCommand(oHulk, ActionMoveToObject(oTarget1));
    DelayCommand(0.3, SetCommandable(FALSE, oHulk));

    DestroyObject(oBid1, 10.0);
    AssignCommand(oBid1, ActionMoveToObject(oTarget2));
    DelayCommand(0.3, SetCommandable(FALSE, oBid1));

    DestroyObject(oBid2, 10.0);
    AssignCommand(oBid2, ActionMoveToObject(oTarget3));
    DelayCommand(0.3, SetCommandable(FALSE, oBid2));
    DestroyObject(oSlave, 10.0);
    AssignCommand(oSlave, ActionMoveToObject(oTarget3));
    DelayCommand(0.3, SetCommandable(FALSE, oSlave));
}

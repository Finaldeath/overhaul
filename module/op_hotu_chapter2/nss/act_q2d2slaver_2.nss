//::///////////////////////////////////////////////
//:: Name act_q2d2slaver_2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    PC has won the auction, slave speaks with PC
    and all the auction people wander off
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: July 31/03
//:://////////////////////////////////////////////

void main()
{
    object oSlave = GetObjectByTag("q2dthrall_slave1");
    object oAuction = OBJECT_SELF;
    object oPC = GetPCSpeaker();
    object oHulk = GetObjectByTag("q2d_ill_hulk");
    object oBid1 = GetObjectByTag("q2d_ill_nur2");
    object oBid2 = GetObjectByTag("q2d_ill_nur3");

    object oTarget1 = GetWaypointByTag("wp_q2d_ill_nur1_exit");
    object oTarget2 = GetWaypointByTag("wp_q2d_ill_nur2_exit");
    object oTarget3 = GetWaypointByTag("wp_q2d_ill_nur3_exit");

    SetLocalInt(oSlave, "nFreed", 1);
    ChangeToStandardFaction(oSlave, STANDARD_FACTION_COMMONER);

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

    //Set variable for slave girls conversation
    SetLocalInt(oSlave, "nPCBought", 1);
    DelayCommand(1.0, AssignCommand(oPC, ClearAllActions(TRUE)));
    DelayCommand(1.3, AssignCommand(oSlave, ActionStartConversation(oPC)));

}

//::///////////////////////////////////////////////
//:: Name act_rumgutescape
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Jump the PC out of Rumgut's cave to the secret
    entrance - set the variable so the secret
    entrance can be used on the other side...
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Mar 5/03
//:://////////////////////////////////////////////

void main()
{
    object wpPC = GetWaypointByTag("wp_q1rumgut_secret");
    SetMapPinEnabled(wpPC, TRUE);
    object oPC = GetPCSpeaker();
    //object oRebecca = GetObjectByTag("q1ruralrebecca");
    //SetLocalInt(oPC, "X1_RumgutSecret", 1);
    //SetLocalInt(oPC, "X1_PCBeccaEscape", 1);
    FadeToBlack(oPC);
    DelayCommand(2.0, BlackScreen(oPC));
    DelayCommand(2.8, AssignCommand(oPC, JumpToObject(wpPC)));
    //DelayCommand(2.8, AssignCommand(oRebecca, ActionJumpToObject(wpPC)));
    DelayCommand(4.0, FadeFromBlack(oPC));
    //DelayCommand(6.0, AssignCommand(oRebecca, ActionStartConversation(oPC)));
}

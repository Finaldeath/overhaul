//::///////////////////////////////////////////////
//:: Name act_rumgutgoin
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Jump the PC into Rumgut's cave from the secret
    entrance
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Mar 5/03
//:://////////////////////////////////////////////

void main()
{
    object wpPC = GetWaypointByTag("wp_q1rumsecretent");
    object oPC = GetPCSpeaker();
    FadeToBlack(oPC);
    DelayCommand(2.0, BlackScreen(oPC));
    DelayCommand(2.8, AssignCommand(oPC, ActionJumpToObject(wpPC)));
    DelayCommand(4.0, FadeFromBlack(oPC));
}

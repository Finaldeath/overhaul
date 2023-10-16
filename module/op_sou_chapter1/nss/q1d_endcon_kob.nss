//::///////////////////////////////////////////////
//:: Name  q1d_endcon_kob
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Aborted conversation for the Kobold Shaman
    in the bubbling cauldron.
    If the conversation is aborted after the
    kobold has talked to the PC about his
    reward for helping the kobolds - the kobolds
    will just leave.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 24/03
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(OBJECT_SELF, "nRewardedPC") == 1)
    {

        //The Players
        object oPC = GetPCSpeaker();
        object oShaman = GetObjectByTag("q1dk_shaman");
        object oKobold1 = GetObjectByTag("q1dk_footpad1");
        object oKobold2 = GetObjectByTag("q1dk_footpad2");
        object oKobold3 = GetObjectByTag("q1dk_footpad3");
        object oKobold4 = GetObjectByTag("q1dk_footpad4");
        object oExit = GetWaypointByTag("wp_q1d_exit");

        AssignCommand(oShaman, ActionMoveToObject(oExit, TRUE));
        AssignCommand(oKobold1, ActionMoveToObject(oExit, TRUE));
        AssignCommand(oKobold2, ActionMoveToObject(oExit, TRUE));
        AssignCommand(oKobold3, ActionMoveToObject(oExit, TRUE));
        AssignCommand(oKobold4, ActionMoveToObject(oExit, TRUE));

        SetCommandable(FALSE, oShaman);
        SetCommandable(FALSE, oKobold1);
        SetCommandable(FALSE, oKobold2);
        SetCommandable(FALSE, oKobold3);
        SetCommandable(FALSE, oKobold4);
    }
}

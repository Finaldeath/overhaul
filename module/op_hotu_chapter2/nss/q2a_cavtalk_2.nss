//::///////////////////////////////////////////////
//::
//:: q2a_cavtalk_2
//::
//:: c_gpc_TalkLevel
//::
//:: Copyright (c) 2001 Bioware Corp.
//::
//::
//:://////////////////////////////////////////////
//::
//::
//:: Increments the L_TalkLevel local each time
//::
//::
//::
//:://////////////////////////////////////////////
//::
//:: Created By: Brent Knowles
//:: Created On: April 20, 2001
//::
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    SetLocalInt(oPC,"X2_CAVALAS_TALKLEVEL",GetLocalInt(oPC,"X2_CAVALAS_TALKLEVEL") + 1);
}

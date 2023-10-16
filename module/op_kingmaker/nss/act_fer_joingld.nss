//::///////////////////////////////////////////////
//:: act_fer_joingld
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    mark the pc as joined the military guild.
    give discount store prices at the smith's.
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Dec 2003
//:://////////////////////////////////////////////

void main()
{
    object oGlassy = GetObjectByTag("q2_glassy");
    SetLocalInt(oGlassy,"OS_JOIN_MILITIA",10);
}

//::///////////////////////////////////////////////
//:: act_mw_garrot
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sets that you've talked to the magic weapon about Garrot's story
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Nov 2003
//:://////////////////////////////////////////////

void main()
{
    object oYenna = GetObjectByTag("q2_yenna");
    SetLocalInt(oYenna,"OS_YENNA_EAVESDROP",25);
}
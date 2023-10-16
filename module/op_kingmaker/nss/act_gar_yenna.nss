//::///////////////////////////////////////////////
//:: Talked to garrot
//:: act_gar_yenna
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC has talked to Garrot about Yenna's story
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

void main()
{
    object oYenna = GetObjectByTag("q2_yenna");
    SetLocalInt(oYenna,"OS_YENNA_EAVESDROP",20);
}

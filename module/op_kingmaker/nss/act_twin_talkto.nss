//::///////////////////////////////////////////////
//:: Twins Talked To
//:: act_twin_talkto
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sets that you've talked to the twins before
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

void main()
{
    object oAlexis = GetObjectByTag("q1_alexis");
    object oAlenor = GetObjectByTag("q1_alenor");
    SetLocalInt(oAlexis,"OS_TALKED_TO",1);
    SetLocalInt(oAlenor,"OS_TALKED_TO",1);
}

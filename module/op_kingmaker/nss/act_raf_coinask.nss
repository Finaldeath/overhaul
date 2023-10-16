//::///////////////////////////////////////////////
//:: Ask About Coin
//:: act_raf_coinask
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC asks about Rafael's coin
    Give PC Rafael's Coin
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(OBJECT_SELF,"OS_RAFAEL_COIN",1);
    CreateItemOnObject("q2_rafaelcoin",GetFirstPC());
}
